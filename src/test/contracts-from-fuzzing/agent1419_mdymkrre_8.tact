struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int? = null;
}

contract DefaultTest {
    rec: Defaults;

    init() {
        self.rec = Defaults{};
    }
}