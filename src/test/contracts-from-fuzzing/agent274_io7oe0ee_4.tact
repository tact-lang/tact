struct NestedOptionals {
    inner: InnerStruct?;
}

struct InnerStruct {
    value: Int?;
}

contract NestedOptTest {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            inner: InnerStruct{
                value: null,
            },
        };
    }

    receive() {}
}
