struct Defaults {
    x: Int = 1 + 2 * 3;
    y: Bool = true && false || true;
}

contract DefaultExprsTest {
    d: Defaults = Defaults{};

    init() {
        self.d = Defaults{x:9,y:false};
    }
}