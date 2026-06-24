struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner?;
    count: Int;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            nested: null,
            count: 100
        };
    }
}
