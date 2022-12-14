import ballerina/log;
import ballerinax/googleapis.calendar;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;

public function main() returns error? {

   calendar:ConnectionConfig config = {
      auth: {
         clientId: clientId,
         clientSecret: clientSecret,
         refreshToken: refreshToken,
         refreshUrl: refreshUrl
      }
   };
   calendar:Client calendarClient = check new (config);

   calendar:CalendarResource|error res = calendarClient->createCalendar("testCalendar2");
   if (res is calendar:CalendarResource) {
      log:printInfo(res.id);
   } else {
      log:printError(res.message());
   }
}