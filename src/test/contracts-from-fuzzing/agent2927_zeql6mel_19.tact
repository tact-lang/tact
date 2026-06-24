struct StructBoolInt {
    flag: Bool;
    num: Int;
}

contract FieldOrderingTest {
    one: StructBoolInt;
    two: StructBoolInt;

    init() {
        self.one = StructBoolInt{ flag: true, num: 11 };
        self.two = StructBoolInt{ flag: false, num: 22 };
    }
}