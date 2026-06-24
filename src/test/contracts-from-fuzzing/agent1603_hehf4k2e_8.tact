struct NestedOptionalDefault {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int? = null;
    text: String = "hello";
}

contract StructDefaultsTest {
    data: NestedOptionalDefault;

    init() {
        self.data = NestedOptionalDefault{ inner: InnerStruct{} };
    }
}