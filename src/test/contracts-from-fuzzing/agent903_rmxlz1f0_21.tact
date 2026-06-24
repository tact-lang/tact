struct ContractStruct {
    x: Int;
}

contract StructInStructsTest {
    s1: ContractStruct;
    s2: ContractStruct;

    init() {
        self.s1 = ContractStruct{ x: 10 };
        self.s2 = self.s1;
    }
}