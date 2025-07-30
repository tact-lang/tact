struct Inner {
    x: Int;
}

struct Outer {
    a: Inner;
    b: Int;
}

contract PartialNested {
    info: Outer;

    init() {
        self.info = Outer{
            a: Inner{ x: 10 },
            b: 20
        };
    }
}