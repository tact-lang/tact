struct NestedNullable {
    foo: Int?;
    bar: Bar?;
}

struct Bar {
    baz: Int?;
}

contract Test {
    data: NestedNullable;
    init() {
        self.data = NestedNullable{
            foo: null,
            bar: null
        };
    }
}