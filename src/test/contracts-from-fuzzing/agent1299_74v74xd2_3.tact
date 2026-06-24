struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
    val3: Address;
    val4: String;
}

contract NestedStructTest {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                val1: 1,
                val2: true,
                val3: myAddress(),
                val4: "test",
            },
        };
    }
}
