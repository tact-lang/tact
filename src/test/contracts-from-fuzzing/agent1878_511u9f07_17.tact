struct Sub {
    note: String?;
}

struct Everything {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    sub: Sub;
}

contract Test {
    all: Everything;

    init() {
        self.all = Everything{
            i: 42,
            b: true,
            s: "hi",
            c: emptyCell(),
            a: myAddress(),
            sub: Sub{ note: null },
        };
    }
}