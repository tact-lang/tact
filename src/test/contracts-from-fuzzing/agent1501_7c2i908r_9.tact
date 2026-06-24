struct OptionalNested {
    item: Int;
    sub: InnerStruct?;
}

struct InnerStruct {
    foo: Int?;
    bar: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            item: 5,
            sub: InnerStruct{ foo: null, bar: 99 },
        };
    }
}