struct X {
    val: Int;
}

struct Y {
    a: Int;
    b: String;
    c: Int?;
    d: String?;
    e: X;
}

contract MixedComplex {
    data: Y;

    init() {
        self.data = Y{ a:1, b:"b", c:null, d:null, e: X{val:42} };
    }
}
