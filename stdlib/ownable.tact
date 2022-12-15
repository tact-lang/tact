message ChangeOwner {
    newOwner: Address;
}

trait Ownable {
    owner: Address;

    fun requireOwner() {
        nativeThrowUnless(132, context().sender == self.owner);
    }

    get fun owner(): Address {
        return self.owner;
    }
}

trait OwnableTransferable with Ownable {

    owner: Address;

    receive(msg: ChangeOwner) {
        
        // Check if the sender is the owner
        self.requireOwner();

        // Update owner
        self.owner = msg.newOwner;
    }
}