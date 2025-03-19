/// Message sent by the owner to transfer ownership of a contract.
///
/// See: https://docs.tact-lang.org/ref/stdlib-ownable#changeowner
///
message ChangeOwner {
    /// Query ID of the change owner request.
    queryId: Int as uint64;
    /// New owner.
    newOwner: Address;
}

/// Message sent by the contract to the owner to confirm the ownership transfer.
///
/// See: https://docs.tact-lang.org/ref/stdlib-ownable#changeownerok
///
message ChangeOwnerOk {
    /// Query ID of the change owner request.
    queryId: Int as uint64;
    /// New owner that was set.
    newOwner: Address;
}

/// Declares the owner (non-editable) of a contract and provides a helper
/// function `requireOwner()`, which checks that a message was sent by the owner.
///
/// This trait requires a field `owner: Address` to be declared and exposes
/// a getter function `owner()`, which reads it from the contract.
///
/// ```tact
/// import "@stdlib/ownable";
///
/// contract ExampleContract with Ownable {
///     owner: Address;
///
///     init(owner: Address) {
///         self.owner = owner;
///     }
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/stdlib-ownable#ownable
///
@interface("org.ton.ownable")
trait Ownable with BaseTrait {
    /// The owner of the contract.
    owner: Address;

    /// Requires that the sender is the owner of the contract.
    fun requireOwner() {
        throwUnless(132, sender() == self.owner);
    }

    /// Returns the owner of the contract.
    get fun owner(): Address {
        return self.owner;
    }
}

/// Extension of `Ownable` that allows transferring ownership of a contract
/// to another address. It provides a secure handler for the message `ChangeOwner`
/// that can be called by the owner to transfer ownership.
///
/// If the ownership transfer request succeeds, the contract will reply with a
/// `ChangeOwnerOk` message.
///
/// ```tact
/// import "@stdlib/ownable";
///
/// contract ExampleContract with OwnableTransferable {
///     owner: Address;
///
///     init(owner: Address) {
///         self.owner = owner;
///     }
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/stdlib-ownable#ownabletransferable
///
@interface("org.ton.ownable.transferable.v2")
trait OwnableTransferable with Ownable {
    /// The owner of the contract.
    owner: Address;

    /// Receiver for the `ChangeOwner` message body, which
    /// can only be processed when sent by the current owner.
    receive(msg: ChangeOwner) {
        // Check if the sender is the owner
        self.requireOwner();

        // Update owner
        self.owner = msg.newOwner;

        // Reply result
        self.reply(ChangeOwnerOk { queryId: msg.queryId, newOwner: msg.newOwner }.toCell());
    }
}
