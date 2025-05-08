struct MixPrim {
    num: Int;
    flag: Bool;
    addr: Address;
    label: String;
}

contract MixedPrimStore {
    store: MixPrim;

    init() {
        self.store = MixPrim{
            num: 77,
            flag: true,
            addr: myAddress(),
            label: "hello"
        };
    }
}
