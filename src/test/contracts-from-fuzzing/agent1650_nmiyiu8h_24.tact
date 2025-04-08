struct DefaultTests {
    foo: Int = 10;
    bar: Bool = false;
    opt: String? = null;
}

contract HasDefaultStruct {
    val: DefaultTests;

    init() {
        self.val = DefaultTests{};
    }
}