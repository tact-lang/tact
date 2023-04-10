message ChangeOwner {
    queryId: Int as uint64;
    newOwner: Address;
}

message ChangeOwnerOk {
    queryId: Int as uint64;
    newOwner: Address;
}

@interface("org.ton.ownable")
trait Ownable {
    owner: Address;

    fun requireOwner() {
        nativeThrowUnless(132, sender() == self.owner);
    }

    get fun owner(): Address {
        return self.owner;
    }
}

@interface("org.ton.ownable.transferable.v2")
trait OwnableTransferable with Ownable {

    owner: Address;

    receive(msg: ChangeOwner) {
        
        // Check if the sender is the owner
        self.requireOwner();

        // Update owner
        self.owner = msg.newOwner;

        // Reply result
        self.reply(ChangeOwnerOk{ queryId: msg.queryId, newOwner:msg.newOwner }.toCell());
    }
}