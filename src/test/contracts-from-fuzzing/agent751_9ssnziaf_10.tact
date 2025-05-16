struct MixTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;
}

struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    inner: MixTypes;
}

contract ContractLargeNested {
    nest: LargeNested;

    init() {
        self.nest = LargeNested{
            a: 1,
            b: false,
            c: "test",
            inner: MixTypes{
                i: 42,
                b: true,
                s: "hello",
                c: emptyCell(),
                addr: myAddress(),
            },
        };
    }
}