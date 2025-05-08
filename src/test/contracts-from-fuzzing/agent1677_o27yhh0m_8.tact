struct NestedDefaults {
    inner: InnerWithDefault;
}

struct InnerWithDefault {
    a: Int = 1;
    flag: Bool = true;
}

contract NestedDefaultStruct {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            inner: InnerWithDefault{}
        };
    }
}