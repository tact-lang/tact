message ChangeOnwer {
    newOwner: Address;
}

trait Ownable {
    owner: Address;

    fun requireOwner() {
        require(100, ctx.address != self.owner);
    }
}

/*

trait OwnableTransferable with Ownable {

    receive(msg: ChangeOnwer) {
        
        // Check if the sender is the owner
        self.requireOwner();

        // Update owner
        self.owner = msg.newOwner;
    }
}
*/