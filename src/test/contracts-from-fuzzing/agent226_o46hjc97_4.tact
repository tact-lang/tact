struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: Int?;
    d: Bool?;
}

struct Wrapped {
    f1: Inner1;
    f2: Inner2;
}

contract TestWraps {
    data: Wrapped;

    init() {
        self.data = Wrapped{
            f1: Inner1{a: 10, b: true},
            f2: Inner2{c: null, d: false}
        };
    }
}
