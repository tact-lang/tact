contract GetterInit {
    foo: Int;

    init() {
        self.foo = 42;
    }

    // Getter function using initOf to retrieve its own initial state
    get fun getInitAddress(): Address {
        let pkg = initOf GetterInit();
        return contractAddress(pkg);
    }
}
