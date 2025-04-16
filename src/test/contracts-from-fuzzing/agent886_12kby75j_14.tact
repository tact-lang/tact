struct SubStruct {
    val: Int;
}

struct MixedTest {
    bigInt: Int;
    smallInt: Int as uint8;
    flag: Bool;
    optFlag: Bool?;
    optInt: Int?;
    nested: SubStruct;
}

contract TestContract {
    mt: MixedTest;

    init() {
        self.mt = MixedTest{
            bigInt: 12345678901234567890,
            smallInt: 255,
            flag: false,
            optFlag: null,
            optInt: 42,
            nested: SubStruct{ val: -999 }
        };
    }
}