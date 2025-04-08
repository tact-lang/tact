struct Defaults {
    x: Int = 10;
    y: Int? = null;
    text: String = "hello";
}

contract DefaultStructTest {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}
