contract Simple {
    init() {}
}

contract Holder {
    simpleState: StateInit;

    init() {
        self.simpleState = initOf Simple();
    }

    get fun simpleAddr() : Address {
         return contractAddress(self.simpleState);
    }
}
