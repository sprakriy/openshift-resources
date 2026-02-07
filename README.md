Project title & objective

Architecture diagram (Pod → Service → Route / port-forward)

Terraform workflow (init, plan, apply)

Sandbox caveats (RBAC, Route limitations)

Screenshots / GIFs of oc get pods, port-forward working

Lessons learned / challenges solved

Pod (nginx-unprivileged:8080)
       |
       v
Service (ClusterIP:80 -> targetPort 8080)
       |
       v
Port-forward or Route (sandbox limitations)
