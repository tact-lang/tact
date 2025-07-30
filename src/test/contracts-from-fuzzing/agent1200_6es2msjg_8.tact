struct NestedOptStruct {
    inner: OptStruct?;
}

struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract NestedOptionalFields {
    data: NestedOptStruct;
    init() {
        self.data = NestedOptStruct{
            inner: null
        };
    }
}