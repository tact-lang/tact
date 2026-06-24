struct Defaults {
    a: Int = 42;
    b: String = "test";
    c: Bool = true;
}

contract DefaultTest {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}