struct DefaultStruct {
    a: Int = 7;
    b: Bool = false;
}

contract StructDefaultFieldTest {
    val: DefaultStruct;

    init() {
        self.val = DefaultStruct{};
    }
}