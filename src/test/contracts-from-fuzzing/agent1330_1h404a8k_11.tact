struct Defaults {
    count: Int = 42;
    name: String = "default";
}

contract DefaultsTest {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
    receive() {}
}
