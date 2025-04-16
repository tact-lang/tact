struct DeepNested {
    val: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    addr: Address;
}

contract Test {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            val: 1,
            inner: InnerStruct{
                flag: false,
                addr: myAddress(),
            },
        };
    }
}