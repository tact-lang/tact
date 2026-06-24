trait Ownable {
    owner: Address;
    
    // Getter function that returns the owner's address
    get fun getOwner(): Address {
        return self.owner;
    }
}

contract Treasure with Ownable {
    owner: Address;

    init(o: Address) {
        self.owner = o;
    }

    receive() {}
}
