struct NestedOptionals {
    foo: Int?;
    bar: String?;
    inner: InnerStruct?;
}

struct InnerStruct {
    a: Bool;
    b: Int?;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            foo: 12,
            bar: null,
            inner: InnerStruct{
                a: true,
                b: null,
            }
        };
    }
}