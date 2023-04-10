
message Deploy {
    queryId: Int as uint64;
}

message DeployOk {
    queryId: Int as uint64;
}

trait Deployable {
    receive(deploy: Deploy) {
        self.reply(DeployOk{queryId: deploy.queryId}.toCell());
    }
}

message FactoryDeploy {
    queryId: Int as uint64;
    cashback: Address;
}

trait FactoryDeployable  {
    receive(deploy: FactoryDeploy) {
        self.forward(deploy.cashback, DeployOk{queryId: deploy.queryId}.toCell());
    }
}