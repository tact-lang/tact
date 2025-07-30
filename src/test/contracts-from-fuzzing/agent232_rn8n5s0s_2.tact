struct DeepNested {
    a: Int;
    b: InnerNested;
}

struct InnerNested {
    c: Int;
    d: Bool?;
    e: Address;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 5,
            b: InnerNested{ c: 10, d: null, e: myAddress() },
        };
    }
}