struct NestedDefaults {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int = 123;
    optVal: Int? = null;
}

contract TestContract {
    st: NestedDefaults;
    init() {
        self.st = NestedDefaults{
            inner: InnerStruct{}
        };
    }
}
