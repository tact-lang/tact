struct MultiType {
    addr: Address;
    num: Int;
    cond: Bool;
    text: String;
    optText: String?;
}

contract TestContract {
    s: MultiType;
    init() {
        self.s = MultiType{
            addr: myAddress(),
            num: 12345,
            cond: true,
            text: "hi",
            optText: null
        };
    }
}