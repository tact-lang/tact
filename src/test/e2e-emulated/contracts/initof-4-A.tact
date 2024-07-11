contract ContractA {
    x: Int;

    init(x: Int) {
        self.x = x;
    }

    receive () {}

    get fun test(x: Int): Address {
        return contractAddress(initOf ContractA(x));
    }
}