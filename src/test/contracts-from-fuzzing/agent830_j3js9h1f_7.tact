struct NestedWithDefaults {
    inner: InnerStruct = InnerStruct{foo:42, bar:true};
    num: Int = 7;
}

struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults{};
    }
}