struct MyStruct {
    a: Int = 0;
    b: Bool = false;
    c: Int? = null;
    d: String = "";
}

contract DefaultsTest {
    val: MyStruct;
    init() {
        self.val = MyStruct{};
    }
}
