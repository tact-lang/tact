struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsTest {
    store: Defaults;

    init() {
        self.store = Defaults{};
    }
}