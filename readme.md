## CMSSW guide and tools  

---

### CCP에서 CMSSW 셋팅법  

1. 사용가능한 gcc 버전을 확인  
```bash
ls /cvmfs/cms.cern.ch
```  


2. SCRAM ARCH 셋팅  
```bash
#export SCRAM_ARCH=slc6_amd64_gcc650
export SCRAM_ARCH=slc6_amd64_gcc700 ## 여기에 gcc버전 넣기
export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
echo "$VO_CMS_SW_DIR $SCRAM_ARCH"
source $VO_CMS_SW_DIR/cmsset_default.sh
export SSL_CERT_DIR='/etc/grid-security/certificates'
```

3. 해당 gcc 버전에서 사용가능한 CMSSW 버전 확인  
```bash  
scram list
```  

4. 맘에드는 CMSSW 설치  
```bash
cmsrel CMSSW_X_X_X  
```

5. CMSSW 환경 셋업  
```bash
cd CMSSW_X_X_X/src
cmsenv
```
- 환경 셋업후 CMSSW 에서 제공하는 tool을 사용할수 있음 (ex ROOT) 

---
### 주의!
* SL6는 올해 만료됨  
* SL7 은 node06 에서만 깔려있음



