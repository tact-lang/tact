struct MixType {
    x: Int;
    flag: Bool;
    addr: Address;
    data: Cell;
    content: String;
}

contract TestMixTypes {
    storage: MixType;

    init() {
        self.storage = MixType{
            x: 99,
            flag: true,
            addr: myAddress(),
            data: emptyCell(),
            content: "Test"
        };
    }
}
