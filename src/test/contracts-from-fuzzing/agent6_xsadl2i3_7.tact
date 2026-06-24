struct Defaults {
    x: Int = 42;
    y: Bool = false;
    s: String = "hi";
}

contract DefTest {
    dat: Defaults;
    init() {
        self.dat = Defaults{};
    }
}