struct Defaults {
    a: Int = 7;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultsTest {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}