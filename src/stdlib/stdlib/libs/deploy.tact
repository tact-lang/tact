
message Deploy {
    queryId: Int as uint64;
}

message DeployOk {
    queryId: Int as uint64;
}

trait Deployable with BaseTrait {
    receive(deploy: Deploy) {
        self.notify(DeployOk{queryId: deploy.queryId}.toCell());
    }
}

message FactoryDeploy {
    queryId: Int as uint64;
    cashback: Address;
}

trait FactoryDeployable with BaseTrait  {
    receive(deploy: FactoryDeploy) {
        self.forward(deploy.cashback, DeployOk{queryId: deploy.queryId}.toCell(), false, null);
    }
}
