struct NestedOptionals {
    val1: Int?;
    val2: Bool?;
    val3: String?;
    inner: InnerStruct?;
}

struct InnerStruct {
    flag1: Bool?;
    number: Int?;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            val1: null,
            val2: true,
            val3: "hello",
            inner: InnerStruct{
                flag1: false,
                number: 7,
            },
        };
    }
}