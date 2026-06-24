struct Boo {
    xx: Int = 1;
    yy: Bool = true;
    zz: String = "hello";
}

contract Test {
    stored: Boo;

    init() {
        self.stored = Boo{};
    }
}