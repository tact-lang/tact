struct X {
    a: Int;
    b: Bool?;
}

struct Y {
    c: X;
    d: Int?;
}

contract NestedOptNested {
    v: Y;

    init() {
        self.v = Y{ c: X{a:5,b:null}, d:null };
    }
}
