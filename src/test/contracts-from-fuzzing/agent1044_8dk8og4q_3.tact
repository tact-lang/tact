struct DefaultTest {
    foo: Int = 7;
    bar: Bool = true;
    baz: String = "hello";
    flag: Bool?;
}

contract TestContract {
    val: DefaultTest;

    init() {
        self.val = DefaultTest{};
    }
}
