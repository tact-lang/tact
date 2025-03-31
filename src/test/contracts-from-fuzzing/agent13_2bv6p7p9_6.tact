contract E {
    init() {}
}

contract F {
    init() {}
}

struct Addresses {
    addrE: Address;
    addrF: Address;
}

contract D {
    // Returning a struct containing both addresses
    get fun getAddresses(): Addresses {
        return Addresses{
            addrE: contractAddress(initOf E()),
            addrF: contractAddress(initOf F())
        };
    }
}
