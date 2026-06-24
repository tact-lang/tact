struct Nested {
    val: Int;
    nestedOpt: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract NestedOptions {
    param: Nested;

    init() {
        self.param = Nested{
            val: 7,
            nestedOpt: Inner{a: 1, b: true}
        };
    }
}
