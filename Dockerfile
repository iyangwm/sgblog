# 第一阶段：Maven 构建环境
FROM maven:3.8.6-jdk-8 AS build
WORKDIR /workspace/sgblog

# 复制整个项目结构
COPY pom.xml ./
COPY sangen-framework ./sangen-framework/
COPY sangen-blog ./sangen-blog/

# 执行多模块构建
RUN mvn -f pom.xml clean package

# 第二阶段：运行时环境
FROM openjdk:8u342-jdk-slim
WORKDIR /app

# 从 build 阶段拷贝生成的 jar 文件（假设打包的是 sangen-blog 模块）
COPY --from=build /workspace/sgblog/sangen-blog/target/*.jar app.jar

# 暴露 7777 端口，用于外部访问 Spring Boot 应用
EXPOSE 7777

 # 启动 Spring Boot 应用
ENTRYPOINT ["java", "-jar", "app.jar"]
