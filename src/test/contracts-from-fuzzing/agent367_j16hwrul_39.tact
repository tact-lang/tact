// optional struct with defaulted primitive fields
struct Defaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
}

contract OptWithDefaultsTest {
    stuff: Defaults?;
    init() {
        self.stuff = null;
    }
}