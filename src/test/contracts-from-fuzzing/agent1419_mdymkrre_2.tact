struct Nested {
    field1: Int;
    field2: Bool;
    nestedOpt: Inner?
}

struct Inner {
    value: Int;
    flag: Bool
}

contract NestedTest {
    data: Nested;

    init() {
        self.data = Nested{
            field1: 10,
            field2: true,
            nestedOpt: Inner{ value: 5, flag: false }
        };
    }
}