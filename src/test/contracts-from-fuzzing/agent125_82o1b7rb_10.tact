struct NestedDefaults {
    foo: Int = 12;
    bar: InnerStruct;
}

struct InnerStruct {
    baz: Int = 34;
}

contract TestContract {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{ bar: InnerStruct{} };
    }
}