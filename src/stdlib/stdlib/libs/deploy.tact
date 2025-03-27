/// Message struct used in a receiver of the **deprecated** `Deployable` trait.
///
/// See: https://docs.tact-lang.org/ref/stdlib-deploy#deploy
///
message(0x946a98b6) Deploy {
    /// Unique identifier for tracking transactions across multiple contracts.
    queryId: Int as uint64;
}

/// Forwarded message struct used in **deprecated**
/// `Deployable` and `FactoryDeployable` traits.
///
/// See: https://docs.tact-lang.org/ref/stdlib-deploy#deployok
///
message(0xaff90f57) DeployOk {
    /// Unique identifier for tracking transactions across multiple contracts.
    queryId: Int as uint64;
}

/// Message struct used in a receiver of the **deprecated** `FactoryDeployable` trait.
///
/// See: https://docs.tact-lang.org/ref/stdlib-deploy#factorydeploy
///
message(0x6d0ff13b) FactoryDeploy {
    /// Unique identifier for tracking transactions across multiple contracts.
    queryId: Int as uint64;

    /// Address to forward `DeployOk` message to.
    cashback: Address;
}

/// **Deprecated** since Tact 1.6.0. Unless you need the `queryId`,
/// use a `null` message body receiver instead of this trait.
///
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
/// See: https://docs.tact-lang.org/ref/stdlib-deploy#deployable
///
trait Deployable with BaseTrait {
    receive(deploy: Deploy) {
        self.notify(DeployOk { queryId: deploy.queryId }.toCell());
    }
}

/// **Deprecated** since Tact 1.6.0. Unless you need the `queryId`,
/// use a `null` message body receiver instead of this trait.
///
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
/// See: https://docs.tact-lang.org/ref/stdlib-deploy#factorydeployable
///
trait FactoryDeployable with BaseTrait {
    receive(deploy: FactoryDeploy) {
        self.forward(deploy.cashback, DeployOk { queryId: deploy.queryId }.toCell(), false, null);
    }
}
