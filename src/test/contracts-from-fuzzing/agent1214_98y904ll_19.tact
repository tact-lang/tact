struct Defaulted {
    x: Int = 10;
    y: Bool = false;
    z: String = "ok";
}

contract Test19 {
    s: Defaulted;
    init() {
        self.s = Defaulted{}; // test instantiation with all defaults
    }
}