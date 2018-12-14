# CS3041 - Information Management

The given task for this project was to create a database around something of interest to us; using MySQL and based on the concepts we studied over the course of the CS3041 module. As the current Chair of the TEDxTrinityCollegeDublin society, I decided to model a database which represents each of the societies ratified by the Central Societies Committee (CSC), their members and their activities. This database could be used by CSC for both internal administration purposes and externally to provide the student body with information regarding society events for e.g. via it’s website which could query the database. While the extent to which you can model information into a database regarding college societies is quite large; in keeping with the scope of this project, I modelled the most common and important data pertaining to college societies in the following entities:

1. Students_Enrolled 
2. College_Societies 
3. Society_Members 
4. Activities
5. Locations
6. Activity_Organisers 
7. Activities_SignUp

With regards to the Students_Enrolled table, in a real-life implementation of this system, this table would likely be connected to in an external read-only database managed by Academic Registry. However, for the purposes of this project, it will be managed by the system administrator i.e. the CSC.
