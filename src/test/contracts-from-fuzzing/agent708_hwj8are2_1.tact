struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner;
    number: Int;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{ val: 10 },
            number: 20
        };
    }
}