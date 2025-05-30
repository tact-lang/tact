struct NestedOptionalStruct {
    nest: OptionalInner?;
}

struct OptionalInner {
    foo: Int;
    bar: Bool;
}

contract NestedOptionalContract {
    someField: NestedOptionalStruct;

    init() {
        self.someField = NestedOptionalStruct{
            nest: null
        };
    }
}
