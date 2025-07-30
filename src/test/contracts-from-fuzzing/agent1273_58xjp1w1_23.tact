struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hey";
}

contract DefaultsTest {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}