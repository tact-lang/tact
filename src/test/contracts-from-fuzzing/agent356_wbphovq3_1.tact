struct Inner {
    y: Int;
}

struct Outer {
    x: Int;
    nested: Inner;
}

contract NestTest {
    value: Outer;

    init() {
        self.value = Outer{
            x: 1,
            nested: Inner{ y: 2 }
        };
    }
}