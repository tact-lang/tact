struct DefaultInitSimple {
    a: Int = 7;
    b: Bool = false;
    c: String = "ok";
}

contract DefaultInitSimpleContract {
    s: DefaultInitSimple;

    init() {
        self.s = DefaultInitSimple{};
    }
}
