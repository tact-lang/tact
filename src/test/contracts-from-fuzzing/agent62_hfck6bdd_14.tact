struct DefaultStruct {
    val: Int = 7;
    flag: Bool = false;
}

contract StructDefaultsTest {
    s: DefaultStruct;

    init() {
        self.s = DefaultStruct{};
    }
}