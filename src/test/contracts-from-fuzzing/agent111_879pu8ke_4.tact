struct MixedTypes {
    n: Int;
    flag: Bool;
    addr: Address;
    blob: Cell;
    text: String;
}

contract TestContract {
    storage: MixedTypes;

    init() {
        self.storage = MixedTypes{
            n: 42,
            flag: true,
            addr: myAddress(),
            blob: emptyCell(),
            text: "hello"
        };
    }
}
