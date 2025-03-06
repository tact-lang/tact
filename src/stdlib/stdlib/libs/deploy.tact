/// Message sent by the deployer to deploy a contract.
message Deploy {
    /// Query ID provided by the deployer.
    queryId: Int as uint64;
}

/// Message sent by the contract to the deployer to confirm the deployment.
message DeployOk {
    /// Query ID provided by the deployer in the `Deploy` message.
    queryId: Int as uint64;
}

/// Provides a convenient unified mechanism for deployments by implementing a 
/// simple receiver for the `Deploy` message.
/// 
/// All contracts are deployed by sending them a message. While any message 
/// can be used for this purpose, the best practice is to use the special 
/// `Deploy` message.
/// 
/// This message has a single field, `queryId`, provided by the deployer 
/// (usually set to zero). If the deployment succeeds, the contract will 
/// reply with a `DeployOk` message and echo the same `queryId` in the response.
///
/// ```tact
/// import "@stdlib/deploy";
/// 
/// contract ExampleContract with Deployable {
///     // Now, this contract has a receiver for the Deploy message
/// }
/// ```
/// 
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#deployable
/// 
trait Deployable with BaseTrait {
    receive(deploy: Deploy) {
        self.notify(DeployOk{queryId: deploy.queryId}.toCell());
    }
}

/// Message sent by the deployer to deploy a contract.
message FactoryDeploy {
    /// Query ID provided by the deployer.
    queryId: Int as uint64;
    /// Address to send the `DeployOk` message to.
    cashback: Address;
}

/// Provides a convenient unified mechanism for chained deployments.
/// 
/// ```tact
/// import "@stdlib/deploy";
///
/// contract ExampleContract with FactoryDeployable {
///     // Now, this contract has a receiver for the FactoryDeploy message
/// }
/// ```
/// 
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#factorydeployable
/// 
trait FactoryDeployable with BaseTrait  {
    receive(deploy: FactoryDeploy) {
        self.forward(deploy.cashback, DeployOk { queryId: deploy.queryId }.toCell(), false, null);
    }
}
