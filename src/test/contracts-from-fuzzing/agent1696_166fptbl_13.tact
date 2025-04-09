struct Defaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "d";
}

contract PartialDefaultsTest {
    s: Defaults;

    init() {
        self.s = Defaults{ b: 99, d: "override" };
    }
}