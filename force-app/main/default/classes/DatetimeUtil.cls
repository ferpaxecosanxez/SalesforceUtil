/**
 * @description       : 
 * @author            : fernando.pacheco@s4g.es
 * @group             : 
 * @last modified on  : 27/07/2022
 * @last modified by  : fernando.pacheco@s4g.es
**/
public with sharing class DatetimeUtil {

    /**
    * @description If the postponement date is outside business hours, the method updates the date to the
    * first business hour.
    *
    * Business hours are defined from 09:00 to 21:00.
    *
    * @author fernando.pacheco@s4g.es | 27/07/2022 
    * @param postponementDatetime Date to validate from UTC 0
    * @return Datetime within schedule
    **/
    private Datetime getDateWithinSchedule(Datetime postponementDatetime) {
        // Get bussiness hours. The results are from UTC 0
        Datetime startBussiness = Datetime.valueOf(
            postponementDatetime.year()+ '-' + postponementDatetime.month() + '-' + postponementDatetime.day()
            + ' 09:00:00'
        );
        Datetime endBussiness = Datetime.valueOf(
            postponementDatetime.year()+ '-' + postponementDatetime.month() + '-' + postponementDatetime.day()
            + ' 21:00:00'
        );

        if (startBussiness <= postponementDatetime && postponementDatetime <= endBussiness) {
            // Postponement datetime is between 09:00 and 21:00 from user UTC
            return postponementDatetime;
        } else {
            // Start bussiness datetime
            return startBussiness;
        }
    }
    
}
