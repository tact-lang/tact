struct Inited {
    a: Int = 1;
    b: Bool = false;
    c: Address? = null;
}

contract Test {
    s: Inited;
    init() {
        self.s = Inited{};
    }
    receive() { let _ = self.s.c; }
}