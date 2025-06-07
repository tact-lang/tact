struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner;
}

struct Container {
    foo: Int;
    bar: Outer;
}

contract MultiLayer {
    value: Container;
    init() {
        self.value = Container{
            foo: 1,
            bar: Outer{
                nested: Inner{ val: 42 }
            }
        };
    }
}