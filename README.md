# 📝 Bat File Utility – Routine Checklist with Timestamp Log

This repository provides a **Windows batch script utility** for managing repeatable workflows with an **interactive checklist** and **timestamped logging**.  

It was originally built for a **GitHub repo update workflow**, but can be customized for any routine step-by-step process.

---

## ✨ Features

- **User Identification**  
  Prompts for `Username` (required) and `Position` (optional).

- **Automatic Logging**  
  Saves a session log under the `/logs` folder with a timestamped filename:  
```
logs/vba_update_<USERNAME>_YYYY-MM-DD_HHMMSS.txt
```

- **Step-by-Step Checklist**  
Displays each step in sequence, waits for a keypress before continuing.

- **Customizable Steps**  
All steps are defined at the start of the script (edit the `step[x]` entries).

- **Timestamp for Each Step**  
Each step is logged with the date and time of completion.

---

## 📂 Code Overview

```bat
:: Example steps
set "step[1]=GitHub Repo Session Started"
set "step[2]=Step 1 Draft description by sections"
set "step[3]=Step 2 GPT - readme, devguide, userguide"
set "step[4]=Step 3 Generalize template.xlsm"
set "step[5]=Step 4 Export all modules to src"
set "step[6]=Step 5 Create repo, fill details, upload files"
set "step[7]=Step 6 Produce example files"
set "step[8]=Step 7 GPT - tests files"
set "step[9]=Step 8 completed Pushed to GitHub"
set "step[10]=Step 9 completed Created GitHub release"
set "step[11]=VBA Update Session Finished"
```
Each step is presented one at a time. Press any key to log completion and move forward.

## 🚀 How to Use
- Clone this repository or copy the .bat file into your workspace.
- Double-click the .bat file to start.
- Enter your username and optionally your position.
- Follow the on-screen checklist, pressing any key to move to the next step.
- Logs are saved in the logs folder automatically.

## 📊 Example Log Output
```
[2025-09-19 10:30:15] GitHub Repo Session Started
[2025-09-19 10:31:00] Step 1 Draft description by sections
[2025-09-19 10:33:42] Step 2 GPT - readme, devguide, userguide
...
[2025-09-19 10:45:12] Step 9 completed Created GitHub release
[2025-09-19 10:46:01] VBA Update Session Finished
```

## 🛠 Customization
- Edit the step[x] entries to match your workflow.
- Change the log filename pattern in this line:
```
set "LOGFILE=%LOGFOLDER%\vba_update_%USERNAME%_!yy!-!mm!-!dd!_!hh!!nn!!ss!.txt"
```
- Add/remove steps as needed by updating the step[] section.

## 📌 Use Cases
- GitHub repo creation workflows
- Project update checklists
- System admin daily routines
- Any repeatable process requiring logs

## 🤝 Contribution
- Feel free to fork, customize, and submit pull requests to extend this utility with:
- Additional logging formats
- Configurable step definitions via external file
- Multi-user logging sessions

## 🔒 Notes
- Designed for Windows environments.
- Requires no external dependencies (pure .bat file).
