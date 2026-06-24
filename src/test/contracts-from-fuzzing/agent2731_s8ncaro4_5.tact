struct Defaults {
    s: String = "default";
    n: Int = 123;
    b: Bool = true;
}

contract DefaultsTest {
    value: Defaults;

    init() {
        self.value = Defaults{};
    }
}