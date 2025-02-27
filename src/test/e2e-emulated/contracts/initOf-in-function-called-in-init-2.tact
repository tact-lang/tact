contract Test {
    owner: Address;

    init() {
        self.owner = middle();
    }

    receive() {}

    get fun owner(): Address {
        return self.owner;
    }
}

fun middle(): Address {
    return master_addr();
}

fun master_addr(): Address {
    return contractAddress(initOf MasterV0());
}

contract MasterV0 {
    state: Int = 0;

    get fun state(): Int {
        return self.state;
    }
}
