/// Global function. Available since Tact 1.6.1.
///
/// Queues an empty message to be sent with the `SendRemainingValue` mode to the destination `Address` `to`. This is the most gas-efficient way to send the remaining value from the incoming message to the given address.
///
/// Attempts to queue more than 255 messages throw an exception with exit code 33: `Action list is too long`.
///
/// ```tact
/// fun example() {
///     // Forward the remaining value back to the sender
///     cashback(sender());
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/stdlib-deploy/#cashback
///
asm fun cashback(to: Address) {
    24 PUSHINT       // 0x18
    NEWC
    6 STU            // .storeUint(0x18, 6)
    STSLICE          // .storeAddress(to)
    0 PUSHINT        // 0
    111 STUR         // .storeUint(0, 111)
    b{} STSLICECONST // .storeSlice(emptySlice())
    ENDC
    66 PUSHINT       // SendRemainingValue | SendIgnoreErrors
    SENDRAWMSG
}

/// The trait `EmptyDeployable` provides a simple unified mechanisms for deployments by adding an empty `receive()` function, which handles all incoming messages with an empty body, i.e., `null{:tact}` body.
///
/// To deploy a contract with this trait, send a message with initial code and data and an empty message body.
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#emptydeployable
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#cashbackdeployable
///
trait EmptyDeployable {
    /// `null` message body receiver for deployment purposes.
    receive() {}
}

/// Similar to `EmptyDeployable` trait, but also forwards the remaining incoming message value back to the sender contract — the initiator of the deployment.
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#cashbackdeployable
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#emptydeployable
///
trait CashbackDeployable {
    /// `null` message body receiver for deployment purposes.
    /// Forwards the remaining value back to the sender.
    receive() { cashback(sender()) }
}

/// Trait with a receiver for the `Deploy` message struct. **Deprecated** since Tact 1.6.0.
///
/// Use `EmptyDeployable` or `CashbackDeployable` instead.
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#emptydeployable
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#cashbackdeployable
///
trait Deployable with BaseTrait {
    receive(deploy: Deploy) {
        self.notify(DeployOk{queryId: deploy.queryId}.toCell());
    }
}

/// The trait `FactoryDeployable` provides a handy unified mechanism for chained deployments. **Deprecated** since Tact 1.6.0.
///
/// See: https://docs.tact-lang.org/ref/stdlib-deploy/#factorydeployable
///
trait FactoryDeployable with BaseTrait  {
    receive(deploy: FactoryDeploy) {
        self.forward(deploy.cashback, DeployOk{queryId: deploy.queryId}.toCell(), false, null);
    }
}

/// Message struct used in a receiver of the **deprecated** `Deployable` trait.
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#deploy
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#deployable
///
message Deploy {
    /// Unique identifier for tracking transactions across multiple contracts.
    queryId: Int as uint64;
}

/// Forwarded message struct used in **deprecated** `Deployable` and `FactoryDeployable` traits.
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#deployok
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#deployable
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#factorydeployable
///
message DeployOk {
    /// Unique identifier for tracking transactions across multiple contracts.
    queryId: Int as uint64;
}

/// Message struct used in a receiver of the **deprecated** `FactoryDeployable` trait.
///
/// See:
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#factorydeploy
/// * https://docs.tact-lang.org/ref/stdlib-deploy/#factorydeployable
///
message FactoryDeploy {
    /// Unique identifier for tracking transactions across multiple contracts.
    queryId: Int as uint64;

    /// Address to forward cashback to.
    cashback: Address;
}
