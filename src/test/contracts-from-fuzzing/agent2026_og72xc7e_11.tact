struct NestedWithDefaults {
    value1: Int = 1;
    value2: Int = 2;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool = true;
    message: String = "default";
}

contract TestContract {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults{
            inner: InnerStruct{}
        };
    }
}