struct Inner {
    x: Int;
    y: Int?;
    flag: Bool;
}

struct Outer {
    a: Inner;
    b: Address;
    c: Cell?;
}

contract Test3 {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{ x: 1, y: null, flag: true },
            b: myAddress(),
            c: null
        };
    }
}
