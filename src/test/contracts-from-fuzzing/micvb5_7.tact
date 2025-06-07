trait Ownable {
    owner: Address;

    fun requireOwner() {
        throwUnless(132, context().sender == self.owner);
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

    // a simple getter to check if the contract is working
    get fun treasureOwner(): Address {
        return self.owner;
    }
}

fun main() {
    // Normally, we would deploy the contract and set an address, but for compilation we just create a dummy call
    return;
}
