struct InnerStruct {
    val: Int = 5;
}

struct NestedDefault {
    inner: InnerStruct = InnerStruct{};
}

contract NestedDefaults {
    data: NestedDefault;

    init() {
        self.data = NestedDefault{};
    }
}