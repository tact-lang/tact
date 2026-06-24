struct Inner {
    val: Int;
}

struct Outer {
    a: Inner?;
    b: Inner?;
}

contract NestedOptionals {
    data: Outer;
    init() {
        self.data = Outer{
            a: null,
            b: Inner{ val: 42 }
        };
    }
}