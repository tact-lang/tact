struct NestedOptionalStruct {
    inner: Int?;
    flag: Bool;
}

contract NestedOptionalInStructTest {
    val: NestedOptionalStruct;

    init() {
        self.val = NestedOptionalStruct{ inner: 10, flag: true };
    }
}