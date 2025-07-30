struct NestedStruct1 {
    s: String;
}

struct NestedStruct2 {
    inner: NestedStruct1;
}

contract StructTest {
    s2: NestedStruct2;

    init() {
        self.s2 = NestedStruct2{
            inner: NestedStruct1{
                s: "test"
            }
        };
    }
}
