struct Inner {
    flag: Bool;
}

struct Outer {
    nested: Inner?;
    val: Int?;
}

contract NestedOptionals {
    foo: Outer;

    init() {
        self.foo = Outer{
            nested: null,
            val: null,
        };
    }
}