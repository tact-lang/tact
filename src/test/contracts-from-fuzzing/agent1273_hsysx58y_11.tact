struct SomeStruct {
    val: Int;
}

contract DefaultsTest {
    s: SomeStruct;
    optInt: Int?;
    optAddr: Address?;
    optBool: Bool?;

    init() {
        self.s = SomeStruct{ val: 1 };
        self.optInt = null;
        self.optAddr = null;
        self.optBool = null;
    }
}