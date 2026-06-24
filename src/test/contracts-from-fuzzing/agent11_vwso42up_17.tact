trait Ownable {
    owner: Address;
    
    // Getter defined in the trait
    get fun getOwner(): Address {
        return self.owner;
    }
}

contract OwnableGetter with Ownable {
    // Persistent variable must be defined in the contract
    owner: Address;

    init(owner: Address) {
        self.owner = owner;
    }

    receive() {}
}
