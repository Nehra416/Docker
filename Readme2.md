# This is called multi stage buil

## Stage-1 Build Stage
```
FROM node:22 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
```
<!-- In last stage we need only the production/build ready folder which is optimized  -->
<!-- we dont need all files or source code for the image -->
<!-- Our motive is to reduce the size of the image by removing unnessary files -->
## Stage-2 Production stage
```
FROM node:22
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 3000
ENV PORT=3000
CMD ["node", "index.js"]
```