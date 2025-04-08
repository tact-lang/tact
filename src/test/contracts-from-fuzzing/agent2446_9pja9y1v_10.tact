struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    i: Int;
    nested: Inner;
}

contract UpdateNested {
    data: Outer;

    init() {
        self.data = Outer{ i:1, nested: Inner{a:2, b:false} };
    }

    receive() {
        self.data = Outer{ i:42, nested: Inner{a: 7, b: true} };
    }
}