struct Foo {
    bar: Int?;
}

contract NestedOptTest {
    data: Foo?;

    init() {
        self.data = null;
    }
}
