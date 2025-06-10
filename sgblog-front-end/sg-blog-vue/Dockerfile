# 使用官方 Node.js 镜像作为基础镜像
FROM node:12-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json 和已安装的 node_modules
COPY package*.json ./
COPY node_modules/ ./node_modules/

# 复制项目源代码
COPY . .

# 构建项目（如果需要）
# RUN npm run build

# 暴露应用运行的端口
EXPOSE 8080

# 启动应用
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
