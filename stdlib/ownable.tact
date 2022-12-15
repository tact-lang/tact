message ChangeOwner {
    newOwner: Address;
}

@interface("org.ton.ownable")
trait Ownable {
    owner: Address;

    fun requireOwner() {
        nativeThrowUnless(132, context().sender == self.owner);
    }

    get fun owner(): Address {
        return self.owner;
    }
}

@interface("org.ton.ownable.transferable")
trait OwnableTransferable with Ownable {

    owner: Address;

    receive(msg: ChangeOwner) {
        
        // Check if the sender is the owner
        self.requireOwner();

        // Update owner
        self.owner = msg.newOwner;
    }
}