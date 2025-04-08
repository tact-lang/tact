struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract StructDupes {
    x: Outer = Outer{
        first: Inner { a: 10, b: true },
        second: Inner { a: 20, b: false }
    };
    sum: Int = 0;

    init() {
        self.sum = self.x.first.a + self.x.second.a;
    }
}
