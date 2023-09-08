#!/usr/bin/env bash

command -v dotnet >/dev/null 2>&1 ||
{
 echo >&2 ".NET Core is not found or not installed,"
 echo >&2 "run 'sh install-deps.sh' to install dependencies.";
 read -p "Press any key to continue...";
 exit 1;
}
while : ; do
  if [ -f EraBitcoinMiner.conf ] ; then
    rm -f EraBitcoinMiner.conf
  fi
  dotnet EraBitcoinMiner.dll allowCPU=false allowIntel=true allowAMD=true allowCUDA=true web3api=https://zksync2-testnet.zksync.dev abiFile=EraBTC.abi contract=0x6dCB84f24c0e5B912e2DbC8E65FA4f1Ac3985232 gasToMine=1 gasApiMax=1 gasLimit=3704624 gasApiURL= gasApiPath=$.safeLow gasApiMultiplier=0.1 gasApiOffset=1.0 minutesBetweenMints=1.0 BlocksPerMint=1.0 privateKey=33185a4f45eb65419fcc5dc0ade6c97c1fcf93212df1de53985b74e272805bcb
  [[ $? -eq 22 ]] || break
done
