# docker-powermta
A Dockerfile implementation for PowerMTA 4.5 Centos7 using supervisord

### Instructions

- Put you license file inside PMTA folder
- Put PowerMTA rpm inside PMTA folder and match the name in Dockerfile
- Change interface in shell.bash /sys/class/net/**docker0**/address to match your licensed mac address
- Put all the pmta config inside PMTA /etc/pmta

### Build and run using helper script
```bash
bash shell.bash local deploy
```

### Enter the container console
```bash
bash shell.bash local exec bash
```

### Check logs
```bash
bash shell.bash local logs
```

### Stop the container
```bash
bash shell.bash local stop
```

### Start the container
```bash
bash shell.bash local start
```

