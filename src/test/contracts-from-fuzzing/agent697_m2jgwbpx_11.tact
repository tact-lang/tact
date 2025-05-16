struct DefaultMix {
    a: Int = 1;
    b: Bool = false;
    c: String = "ok";
    d: Int?; // implicitly null default
    e: Bool? = true;
    f: String? = null;
}

contract Test {
    s: DefaultMix = DefaultMix{};

    init() {
        self.s = DefaultMix{ a: 10, b: true, c: "wow", d: 33, e: false, f: "hi" };
    }

    receive() {}
}
