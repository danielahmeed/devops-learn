# Server Performance Stats Script

A simple bash script to analyze and report basic server performance statistics on Linux systems.

## Features

This script calculates and displays:
*   **Total CPU Usage**: Current CPU utilization percentage.
*   **Total Memory Usage**: Used and free memory with percentages.
*   **Total Disk Usage**: Disk space usage for mounted filesystems (excluding tmpfs/loops).
*   **Top 5 Processes by CPU**: The 5 most CPU-intensive processes currently running.
*   **Top 5 Processes by Memory**: The 5 most memory-intensive processes currently running.
*   **Additional Stats**:
    *   OS Version
    *   System Uptime
    *   Load Average
    *   Number of Logged-in Users

## Requirements

*   A Linux server (Ubuntu, Debian, CentOS, etc.)
*   Bash shell
*   Standard utilities: `top`, `free`, `df`, `ps`, `awk`, `grep` (usually pre-installed on most distros).

## Installation & Usage

1.  **Download or Clone** the script to your server.

2.  **Make the script executable**:
    Run the following command in your terminal:
    ```bash
    chmod +x server-stats.sh
    ```

3.  **Run the script**:
    Execute the script directly:
    ```bash
    ./server-stats.sh
    ```

## Example Output

```text
===========================================
       Server Performance Stats
===========================================

-------------------------------------------
Total CPU Usage:
-------------------------------------------
CPU Usage: 15.2%

-------------------------------------------
Total Memory Usage:
-------------------------------------------
Used: 4096MB (25.00%) / Total: 16384MB (Free: 8192MB)

-------------------------------------------
Total Disk Usage:
-------------------------------------------
20G used on /dev/sda1 (Size: 100G, Used: 20G, Free: 80G)
...
```

## License

Free to use for educational and debugging purposes.
