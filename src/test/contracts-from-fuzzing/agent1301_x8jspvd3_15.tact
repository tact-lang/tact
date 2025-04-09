struct OptSubDefault {
    s: Sub? = null;
}

struct Sub {
    x: Int;
    y: Bool;
}

contract TestContract {
    o: OptSubDefault;
    init() {
        self.o = OptSubDefault{};
    }
}