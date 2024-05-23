trait Ownable {
    owner: Address;

    fun requireOwner() {
        nativeThrowUnless(132, context().sender == self.owner);
    }

    get fun owner(): Address {
        return self.owner;
    }
}

contract Treasure with Ownable {
    owner: Address;

    init(owner: Address) {
        self.owner = owner;
    }
}