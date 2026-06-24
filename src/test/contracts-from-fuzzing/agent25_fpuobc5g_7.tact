struct Nested {
    flag: Bool;
    content: InnerNested;
}

struct InnerNested {
    s: String;
    c: Cell;
    addr: Address;
}

contract Test {
    n: Nested;
    init() {
        self.n = Nested{
            flag: false,
            content: InnerNested{
                s: "abc",
                c: emptyCell(),
                addr: myAddress()
            }
        };
    }
}