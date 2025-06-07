struct DeepNest {
    s1: String;
    s2: String?;
    n1: Int;
    n2: Int?;
    inner1: Inner1;
}

struct Inner1 {
    b: Bool;
    inner2: Inner2;
}

struct Inner2 {
    f: Address;
    c: Cell;
}

contract Test {
    x: DeepNest;
    init() {
        self.x = DeepNest{
            s1: "foo",
            s2: null,
            n1: 1,
            n2: null,
            inner1: Inner1{
                b: true,
                inner2: Inner2{
                    f: myAddress(),
                    c: emptyCell()
                }
            }
        };
    }
}