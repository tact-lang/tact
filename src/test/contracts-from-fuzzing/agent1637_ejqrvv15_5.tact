struct NestedOptionals {
    inner: InnerStruct?;
}

struct InnerStruct {
    foo: Int?;
    bar: Bool;
}

contract NestedOptionalsTest {
    val: NestedOptionals;

    init() {
        self.val = NestedOptionals{
            inner: InnerStruct{
                foo: null,
                bar: true,
            },
        };
    }
}