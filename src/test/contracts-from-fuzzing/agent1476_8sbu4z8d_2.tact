struct NestedStruct1 {
    flag: Bool;
    amount: Int;
}

contract StructFieldTest {
    data: NestedStruct1;

    init() {
        self.data = NestedStruct1{
            flag: true,
            amount: 10,
        };
    }
}