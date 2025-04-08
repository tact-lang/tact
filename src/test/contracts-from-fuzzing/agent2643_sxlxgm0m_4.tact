struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int?;
    flag: Bool?;
    text: String?;
}

contract OptNestedTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: InnerStruct{
                val: 10,
                flag: true,
                text: "hello"
            }
        };
    }
}
