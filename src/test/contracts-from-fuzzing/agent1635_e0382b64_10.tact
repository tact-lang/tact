struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Bool;
}

struct Outer {
    f1: Inner1;
    f2: Inner2;
}

contract MultiNest {
    data: Outer;

    init() {
        self.data = Outer {
            f1: Inner1{a: 7},
            f2: Inner2{b: false}
        };
    }
}
