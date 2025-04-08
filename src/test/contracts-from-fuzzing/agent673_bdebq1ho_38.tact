struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inr: Inner;
}

contract ManyWrapped {
    o1: Outer;
    o2: Outer;

    init() {
        self.o1 = Outer{ inr: Inner{ a:1, b:true } };
        self.o2 = Outer{ inr: Inner{ a:2, b:false } };
    }
}