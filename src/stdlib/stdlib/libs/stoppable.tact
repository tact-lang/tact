import "./ownable";

/// Implements a receiver for the message `"Stop"` that can be sent by the owner.
///
/// Trait implements the `stopped()` [getter function] that returns `true` if the contract
/// is stopped (or `false` otherwise) and provides private (non-getter) functions
/// `requireNotStopped()` and `requireStopped()`.
///
/// ```tact
/// import "@stdlib/ownable";
/// import "@stdlib/stoppable";
///
/// contract MyContract with Stoppable {
///    owner: Address;
///    stopped: Bool;
///
///    init(owner: Address) {
///        self.owner = owner;
///        self.stopped = false;
///    }
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/stdlib-stoppable#stoppable
///
/// [getter function]: https://docs.tact-lang.org/book/functions#getter-functions
///
@interface("org.ton.stoppable")
trait Stoppable with Ownable {
    /// Whether the contract is stopped.
    stopped: Bool;

    /// The owner of the contract.
    owner: Address;

    /// Requires the contract to be not stopped.
    ///
    /// #### Exit codes
    ///
    /// * 133: [Contract stopped] — if the contract is stopped.
    ///
    /// [Contract stopped]: https://docs.tact-lang.org/book/exit-codes#133
    ///
    fun requireNotStopped() {
        throwUnless(TactExitCodeContractStopped, !self.stopped);
    }

    /// Requires the contract to be stopped.
    fun requireStopped() {
        require(self.stopped, "Contract not stopped");
    }

    /// Receiver for the message `"Stop"` that stops the contract.
    ///
    /// Can only be called by the owner and if the contract is not stopped already.
    receive("Stop") {
        self.requireOwner();
        self.requireNotStopped();
        self.stopped = true;
        self.reply("Stopped".asComment());
    }

    /// Returns `true` if the contract is stopped (or `false` otherwise).
    get fun stopped(): Bool {
        return self.stopped;
    }
}

/// Extends the `Stoppable` trait and allows resuming contract execution.
///
/// Trait implements a receiver for the message `"Resume"` that resumes the contract execution.
///
/// ```tact
/// import "@stdlib/ownable";
/// import "@stdlib/stoppable";
///
/// contract MyContract with Resumable {
///     owner: Address;
///     stopped: Bool;
///
///     init(owner: Address) {
///         self.owner = owner;
///         self.stopped = false;
///     }
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/stdlib-stoppable#resumable
///
@interface("org.ton.resumable")
trait Resumable with Stoppable {
    /// Whether the contract is stopped.
    stopped: Bool;

    /// The owner of the contract.
    owner: Address;

    /// Receiver for the message `"Resume"` that resumes the contract execution.
    ///
    /// Can only be called by the owner and if the contract is stopped.
    receive("Resume") {
        self.requireOwner();
        self.requireStopped();
        self.stopped = false;
        self.reply("Resumed".asComment());
    }
}
