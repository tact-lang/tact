struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int?;
    txt: String?;
}

contract OptionalNestedTest {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{ inner: null };
    }
}