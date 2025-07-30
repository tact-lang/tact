struct X {
    a: Int;
    b: Bool;
}

struct Y {
    c: Int;
    d: Bool;
}

contract TwoStructs {
    first: X;
    second: Y;

    init() {
        self.first = X{ a:1, b:false };
        self.second = Y{ c:2, d:true };
    }
}