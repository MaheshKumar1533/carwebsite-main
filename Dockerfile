FROM nginx:alpine

COPY carwebsite/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
