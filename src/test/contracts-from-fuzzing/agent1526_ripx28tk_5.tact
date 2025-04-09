struct NestedOptionals {
    inner: InnerStruct?;
}

struct InnerStruct {
    foo: Int;
    text: String;
}

contract NestedOptionalContract {
    val: NestedOptionals;

    init() {
        self.val = NestedOptionals{
            inner: InnerStruct{
                foo: 123,
                text: "test",
            }
        };
    }
}