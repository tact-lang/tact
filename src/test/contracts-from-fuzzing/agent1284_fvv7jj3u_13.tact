struct DefaultStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "ok";
}

contract DefaultsTest {
    val: DefaultStruct;

    init() {
        self.val = DefaultStruct{};
    }
}