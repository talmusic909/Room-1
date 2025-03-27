# Room-1
# PingStorm - בודק השהיית שירותי אינטרנט

פרויקט זה יוצר כלי Bash בשם PingStorm המודד ומשווה השהיית אינטרנט למספר שירותים מקוונים מרכזיים.

## שימוש

1.  הפעל את `pingstorm.sh` כדי לבצע בדיקת פינג.
2.  הפעל את `analyze_results.sh` כדי לנתח ולהציג את התוצאות.
3.  הפעל את `export_csv.sh` כדי לייצא את התוצאות לקובץ CSV.
4.  השתמש ב-`pingstorm_control.sh` כדי לשלוט בסקריפט `pingstorm.sh`.

## דרישות

* Bash
* ping

## חברי הצוות

* [Tal Tson]
* [May Sabag]
* [Yarden Brami]
* [Sabrin Katrus]
* [Rotem Haimovich]
* [ Saja Ibrahem ]

בטח, הנה סדר ההפעלה של הסקריפטים עם הסבר על כל קובץ, בצורה נוחה להעתקה וקריאה, תוך שמירה על הפרדה בין אנגלית לעברית:

```
1. pingstorm.sh
   * סקריפט זה מבצע בדיקות פינג (ping) על רשימת שירותי אינטרנט מרכזיים ומייצר את קובץ התוצאות `ping_results.txt`.
   * (This script performs ping tests on a list of central internet services and generates the `ping_results.txt` results file.)

2. analyze_results.sh
   * סקריפט זה מנתח את התוצאות מ-`ping_results.txt` ומציג אותן בטרמינל בצורה נוחה לקריאה.
   * (This script analyzes the results from `ping_results.txt` and displays them in the terminal in a user-friendly format.)

3. export_csv.sh
   * סקריפט זה מייצא את התוצאות מ-`ping_results.txt` לקובץ CSV, כך שניתן לנתח אותן בגיליון אלקטרוני.
   * (This script exports the results from `ping_results.txt` to a CSV file, allowing for analysis in a spreadsheet.)

4. copy_file.sh
   * סקריפט זה מעתיק קובץ מקור לתיקיית יעד, בהתאם לקלט המשתמש.
   * (This script copies a source file to a destination directory, based on user input.)

5. pingstorm_control.sh
   * סקריפט זה משמש לשליטה בסקריפט `pingstorm.sh` (התחלה, עצירה, סטטוס, הצגת יומן).
   * (This script is used to control the `pingstorm.sh` script (start, stop, status, view logs).)
`


![diagram](images/pingstorm-flow.png)
הסבר מפורט יותר על הדיאגרמה:

אלמנטים מרכזיים:

סקריפטים (Scripts): אלה הם קבצי ה-Bash (כמו pingstorm.sh, analyze_results.sh וכו') המבצעים פעולות שונות בפרויקט.
קבצים (Files): אלה הם קבצי טקסט (כמו ping_results.txt, pingstorm.log וכו') המשמשים לאחסון נתונים ורישום פעולות.
מסדי נתונים (Databases): משמשים לאחסון וניהול נתונים.
ממשקי API (APIs): מאפשרים תקשורת בין סקריפטים ובין מערכות חיצוניות.
זרימת הפרויקט:

התחלה (Start): יצירת פרויקט GitHub והקמת סביבת העבודה.
יצירת סקריפטים וקבצים: יצירת כל קבצי הסקריפטים וקבצי הטקסט הנדרשים.
הרצת סקריפטים: הרצת הסקריפטים בסדר הנכון (כפי שציינתי קודם לכן) כדי לבצע את הפעולות הנדרשות (בדיקות פינג, ניתוח תוצאות, ייצוא נתונים וכו').
שימוש בקבצים: הסקריפטים משתמשים בקבצים לאחסון וקריאת נתונים.
שימוש במסדי נתונים ו-APIs (אופציונלי): אם נדרש, הסקריפטים משתמשים במסדי נתונים וב-APIs כדי לאחסן ולשתף נתונים.
סיום (End): פרויקט הושלם.