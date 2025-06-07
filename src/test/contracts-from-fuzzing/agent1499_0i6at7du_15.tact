struct OptStruct {
    s: String?;
    a: Address?;
}

contract OptStringAddress {
    store: OptStruct;
    init() {
        self.store = OptStruct{ s: null, a: null };
    }
    receive() {}
}