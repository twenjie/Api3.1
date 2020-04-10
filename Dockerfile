#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app1
EXPOSE 8200

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["Api3.1.csproj", ""]
RUN dotnet restore "./Api3.1.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "Api3.1.csproj" -c Release -o /app1/build

FROM build AS publish
RUN dotnet publish "Api3.1.csproj" -c Release -o /app1/publish

FROM base AS final
WORKDIR /app1
COPY --from=publish /app1/publish .
ENTRYPOINT ["dotnet", "Api3.1.dll"]