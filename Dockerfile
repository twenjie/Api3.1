#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim
WORKDIR /app
EXPOSE 8100

RUN dotnet restore "./Api3.1.csproj"
COPY . .
ENTRYPOINT ["dotnet", "Api3.1.dll"]