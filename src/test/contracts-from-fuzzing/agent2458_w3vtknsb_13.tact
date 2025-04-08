struct NestedMany {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    x1: Bool;
    x2: String;
}

struct Inner2 {
    y1: Address;
    y2: String?;
    y3: Bool?;
    y4: Int?;
    y5: Inner3;
}

struct Inner3 {
    z1: Int;
    z2: String;
    z3: Bool;
}

contract TestContract {
    data: NestedMany;

    init() {
        self.data = NestedMany{
            a: 42,
            b: Inner1{
                x1: true,
                x2: "abc"
            },
            c: Inner2{
                y1: myAddress(),
                y2: null,
                y3: null,
                y4: null,
                y5: Inner3{
                    z1: 1,
                    z2: "def",
                    z3: false
                }
            }
        };
    }
}