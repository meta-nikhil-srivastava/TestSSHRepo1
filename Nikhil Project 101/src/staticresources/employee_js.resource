var myApps = angular.module('myApp', []);
            myApps.controller('myController', ['$scope','$http','$location',function($scope, $http, $location) {

//                  $http.get('resources/json/content.json').success(function (response) {
               $http.get("{!URLFOR($Resource.index_resources,'resources/json/content.json')}").success(function (response) { //for visualforce

                    $scope.details = response;
                });


                $scope.editJson = function () {
                    $scope.details.push({
                    Name: $scope.content.Name
                  , City: $scope.content.City
                    });
                    $http({
                        method: "POST"
                        , data: $scope.details
                        , url: "{!URLFOR($Resource.index_resources,'resources/json/content.json')}"
//                         , url:'resources/json/content.json'
                    }).then(function (response) {});
                }


            }]);
