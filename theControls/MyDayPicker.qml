import QtQuick 2.15
import "../theScripts/calculateDates.js" as CD

Item
{
    id:root;
    anchors.fill: parent;


    signal monPicked;
    signal tuePicked;
    signal wedPicked;
    signal thuPicked;
    signal friPicked;
    signal satPicked;
    signal sunPicked;
    onMonPicked:
    {
        CD.pickWeek("monday",true,week1,week2,week3,week4,week5,week6);
    }
    onTuePicked:
    {
        CD.pickWeek("tuesday",true,week1,week2,week3,week4,week5,week6);
    }
    onWedPicked:
    {
        CD.pickWeek("wednesday",true,week1,week2,week3,week4,week5,week6);
    }
    onThuPicked:
    {
        CD.pickWeek("thursday",true,week1,week2,week3,week4,week5,week6);
    }
    onFriPicked:
    {
        CD.pickWeek("friday",true,week1,week2,week3,week4,week5,week6);
    }
    onSatPicked:
    {
        CD.pickWeek("saturday",true,week1,week2,week3,week4,week5,week6);
    }
    onSunPicked:
    {
        CD.pickWeek("sunday",true,week1,week2,week3,week4,week5,week6);
    }

    signal monUnpicked;
    signal tueUnpicked;
    signal wedUnpicked;
    signal thuUnpicked;
    signal friUnpicked;
    signal satUnpicked;
    signal sunUnpicked;

    onMonUnpicked:
    {
        CD.pickWeek("monday",false,week1,week2,week3,week4,week5,week6);
    }
    onTueUnpicked:
    {
        CD.pickWeek("tuesday",false,week1,week2,week3,week4,week5,week6);
    }
    onWedUnpicked:
    {
        CD.pickWeek("wednesday",false,week1,week2,week3,week4,week5,week6);
    }
    onThuUnpicked:
    {
        CD.pickWeek("thursday",false,week1,week2,week3,week4,week5,week6);
    }
    onFriUnpicked:
    {
        CD.pickWeek("friday",false,week1,week2,week3,week4,week5,week6);
    }
    onSatUnpicked:
    {
        CD.pickWeek("saturday",false,week1,week2,week3,week4,week5,week6);
    }
    onSunUnpicked:
    {
        CD.pickWeek("sunday",false,week1,week2,week3,week4,week5,week6);
    }

    property int pickMode: 2;
    /*
        1 -> only one pick
        2 -> mutiple pick
    */

//    property variant setPickedDays: [0];
//    /*
//      0 -> no select
//      (1 t0 29 or 28 or 31 or 30) -> select that day
//    */


    property bool setViewOnlyStatus:false;
    property int setMonth: 1;
    property int setYear: 2022;



    onSetMonthChanged:
    {
        console.log(week1.outputPickedDays);
        console.log(week2.outputPickedDays);
        console.log(week3.outputPickedDays);
        console.log(week4.outputPickedDays);
        console.log(week5.outputPickedDays);
        console.log(week6.outputPickedDays);
        CD.resetAllSelectedElements(week1);
        CD.resetAllSelectedElements(week2);
        CD.resetAllSelectedElements(week3);
        CD.resetAllSelectedElements(week4);
        CD.resetAllSelectedElements(week5);
        CD.resetAllSelectedElements(week6);
    }
    onSetYearChanged:
    {
        CD.resetAllSelectedElements(week1);
        CD.resetAllSelectedElements(week2);
        CD.resetAllSelectedElements(week3);
        CD.resetAllSelectedElements(week4);
        CD.resetAllSelectedElements(week5);
        CD.resetAllSelectedElements(week6);
    }

    property variant monthDays: CD.automaticMonth(setYear,setMonth);
    property int countColumns: CD.calculateColumns_of_MonthDays(monthDays.length);

//    onMonthDaysChanged:
//    {
//        console.log("\n\n\n monthdays: "+monthDays);
//        console.log(CD.weekdayFromDate(setYear,setMonth,"text")+ " ==============");
//    }
//    onMonthDaysForShowChanged:
//    {
//        console.log("\n\n\nmonthDaysForShow: "+monthDaysForShow);
//    }

    property variant monthDaysForShow: CD.automaticMonth(setYear,setMonth,true);//true parameter is for free spacer


    Column
    {
        anchors.fill: parent;
        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                id:week1;
                setPickMode: pickMode;
                setMonthDayPicker:true;
                setViewOnly: setViewOnlyStatus;
                emptyTextForAll:"0"; //will set disable(false),opcity(zero),bgColor:unknonw(transparent) for '0' values
                setBaseRadius:100;
                textAPick:monthDaysForShow[0];
                textBPick:monthDaysForShow[1];
                textCPick:monthDaysForShow[2];
                textDPick:monthDaysForShow[3];
                textEPick:monthDaysForShow[4];
                textFPick:monthDaysForShow[5];
                textGPick:monthDaysForShow[6];
            }
        }
        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                id:week2;
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[7];
                textBPick:monthDaysForShow[8];
                textCPick:monthDaysForShow[9];
                textDPick:monthDaysForShow[10];
                textEPick: monthDaysForShow[11];
                textFPick: monthDaysForShow[12];
                textGPick: monthDaysForShow[13];
                setViewOnly: setViewOnlyStatus;
            }
        }

        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                id:week3;
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[14];
                textBPick:monthDaysForShow[15];
                textCPick:monthDaysForShow[16];
                textDPick:monthDaysForShow[17];
                textEPick: monthDaysForShow[18];
                textFPick: monthDaysForShow[19];
                textGPick: monthDaysForShow[20];
                setViewOnly: setViewOnlyStatus;
            }
        }


        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                id:week4;
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[21];
                textBPick:monthDaysForShow[22];
                textCPick:monthDaysForShow[23];
                textDPick:monthDaysForShow[24];
                textEPick: monthDaysForShow[25];
                textFPick: monthDaysForShow[26];
                textGPick: monthDaysForShow[27];
                setViewOnly: setViewOnlyStatus;
            }
        }

        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                id:week5;
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[28];
                textBPick:monthDaysForShow[29];
                textCPick:monthDaysForShow[30];
                textDPick:monthDaysForShow[31];
                textEPick: monthDaysForShow[32];
                textFPick: monthDaysForShow[33];
                textGPick: monthDaysForShow[34];
                setViewOnly: setViewOnlyStatus;
            }
        }

        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                id:week6;
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[35];
                textBPick:monthDaysForShow[36];
                textCPick:monthDaysForShow[37];
                textDPick:monthDaysForShow[38];
                textEPick:monthDaysForShow[39];
                textFPick:monthDaysForShow[40];
                textGPick:monthDaysForShow[41];
                setViewOnly: setViewOnlyStatus;
            }
        }

    }
}

