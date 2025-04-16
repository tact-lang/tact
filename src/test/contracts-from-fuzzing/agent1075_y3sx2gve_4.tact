struct MixedTypes {
    num: Int;
    flag: Bool;
    addr: Address;
    data: Cell;
    text: String;
}

contract MixedStorage {
    mixed: MixedTypes;

    init() {
        self.mixed = MixedTypes{
            num: 123,
            flag: true,
            addr: myAddress(),
            data: emptyCell(),
            text: "hello",
        };
    }
}
