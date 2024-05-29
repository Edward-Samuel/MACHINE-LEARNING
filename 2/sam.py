import pandas as pd
import numpy as np
data=pd.read_csv("dataset.csv")
ins=np.array(data)[:,:-1]
target=np.array(data)[:,-1]
def learn(ins,target):
    for i,val in enumerate(target):
        if val=="Yes":
            specific_hypo = ins[i].copy()
            break
    print("\nINITIALIZATION OF SPECIFIC_HYPOTHESIS AND GENERAL_HYPOTHESIS")
    print("S:",specific_hypo)
    general_hypo = [["?" for i in range(len(specific_hypo))] for i in range(len(specific_hypo))]
    print("G:",general_hypo)
    print("\n",'*'*210)
    for i,val in enumerate(ins):
        if target[i] == "Yes":
            for x in range(len(specific_hypo)):
                if val[x] != specific_hypo[x]:
                    specific_hypo[x] = '?'
        if target[i] == "No":
            for x in range(len(specific_hypo)):
                if val[x] != specific_hypo[x]:
                    general_hypo[x][x] = specific_hypo[x]
                else:
                    general_hypo[x][x] = '?'
        print("\nINSTANCE NO. :",i+1)
        print("S:",specific_hypo)
        print("G:",general_hypo)

    indices = [i for i,val in enumerate(general_hypo) if val == ['?','?','?','?','?','?']]
    for i in indices:
        general_hypo.remove(['?','?','?','?','?','?'])
    return specific_hypo,general_hypo
specific_hypo_final,general_hypo_final = learn(ins,target)
print("\n",'*'*210)
print("\nFINAL SPECIFIC_HYPOTHESIS:","\nS:",specific_hypo_final)
print("\nFINAL GENERAL_HYPOTHESIS:","\nG:",general_hypo_final)