struct Inner {
    val: Int;
}

struct Outer {
    val: Int;
    nested: Inner;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            val: 1,
            nested: Inner{ val: 2 },
        };
    }
}