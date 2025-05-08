struct OptionalNested {
    inner: InnerStruct?;
    number: Int;
}

struct InnerStruct {
    foo: Int;
    bar: String;
}

contract TestContract {
    optionalDeep: OptionalNested;

    init() {
        self.optionalDeep = OptionalNested{
            inner: null,
            number: 7
        };
    }
}