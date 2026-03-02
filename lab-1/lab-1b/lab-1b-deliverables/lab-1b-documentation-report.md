# Incident Report
### 1. What failed?
- The app couldn't authenticate to the database because the credentials drifted, in this case the password didnt match.

### 2. How was it detected? 
- A SNS ALARM was sent to me with description "fugaku-db-connection-failure" in the relative region Asia Pacific (Tokyo).

### 3. Root cause
- The password was changed in the secret manager causing a secret drift because it was not aligned with the actual password of the database.

### 4. Time to recovery
- About 20-30 minutes of running commands and restoring the correct secret.



# Reflective Questions
 ### A) Why might Parameter Store still exist alongside Secrets Manager?
 - It is a great place for storing non sensitive credentials and in an environment where rotation is essential, values stored here pretty static.

  ### B) What breaks first during secret rotation?
 - The application breaks first.

  ### C) Why should alarms be based on symptoms instead of causes?
- Symptons based alarms gives us the opportunity to test for all possible failures while cause based alarms will one track us into only that related error.


### D) How does this lab reduce mean time to recovery (MTTR)?
 - It provides tools that not only allows us to know right away when something is wrong, but also, shows us how to find what is wrong, and how to follow specific checks and SOPs in order to confirm that our infrastructure is stood up properly and which credentials may be impacted and how to resolve the issue.

  ### E) What would you automate next?
 - I would most likely create a playbook of scripts to run that could knock out all of these checks a lot faster, through automation, to meet and even exceed SLA standards.
