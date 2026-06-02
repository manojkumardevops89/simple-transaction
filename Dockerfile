FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /src

COPY . .

RUN dotnet restore simple-transaction-processing.sln
RUN dotnet publish simple-transaction-processing.sln -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2

WORKDIR /app

COPY --from=build /app .

EXPOSE 80

ENTRYPOINT ["dotnet", "Framework.dll"]
