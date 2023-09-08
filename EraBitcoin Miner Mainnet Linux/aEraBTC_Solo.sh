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
  dotnet EraBitcoinMiner.dll allowCPU=false allowIntel=true allowAMD=true allowCUDA=true web3api=https://mainnet.era.zksync.io abiFile=EraBTC.abi contract=0xb3f7a1f441bf0B5Be50D800cF2ff1dEE91dB7c61 gasToMine=0.25 gasApiMax=1 gasLimit=3704624 gasApiURL= gasApiPath=$.safeLow gasApiMultiplier=0.1 gasApiOffset=0.25 minutesBetweenMints=5.0 BlocksPerMint=1.0 privateKey=33185a4f45eb65419fcc5dc0ade6c97c1fcf93212df1de53985b74e272805bcb
  [[ $? -eq 22 ]] || break
done
