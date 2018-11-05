# NasaMilkyWayApp

I use the following 3rd party libraries in the project:
* Kingfisher for image downloading and caching from url
* Alamofire for network request handling

I chose these libraries since they were updated to swift 4. I installed them via Cocoapods.

Before running the project please run the following command in the terminal in the NasaMilkyWay folder where you find the podlife:
 pod install
If you don’t have Cocoapods please check the installation guide here: https://cocoapods.org/

For checking whether the phone is connected to the internet I used the Reachability class from Stackoverflow, all credit goes to Rajamoham S.
https://stackoverflow.com/questions/30743408/check-for-internet-connection-with-swift

# Things to improve
* Currently the file structure are only grouped together by scenes, so an improvement could be to have a proper architecture and reorganize into MVVM for example, but I don’t have enough experience with that.
* The main screen in plain white until the I get and process the request from the server as an improvement I could add a default image and/or a message for the user such as ‘Please wait, we are processing your request’
* If the network connection is slow it can take a while to process the request and the main screen will be blank for longer. I was thinking to make subrequest and get the images monthly in 2017, but the API only supported the year parameter.
