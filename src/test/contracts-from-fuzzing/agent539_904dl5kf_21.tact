struct DoubleNested {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    a: Int;
    s: String;
}

struct Inner2 {
    b: Bool;
    addr: Address;
    c: Cell;
}

contract TestContract {
    dn: DoubleNested;
    init() {
        self.dn = DoubleNested{
            inner1: Inner1{
                a: 50,
                s: "hi",
            },
            inner2: Inner2{
                b: true,
                addr: myAddress(),
                c: emptyCell(),
            }
        };
    }
}