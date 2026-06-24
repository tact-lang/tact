struct ComplexNested {
    s: String?;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    deep: DeepestStruct;
}

struct DeepestStruct {
    number: Int?;
}

contract ComplexNestedTest {
    data: ComplexNested;

    init() {
        self.data = ComplexNested{
            s: null,
            inner: InnerStruct{
                flag: true,
                deep: DeepestStruct{
                    number: 123
                }
            }
        };
    }
}