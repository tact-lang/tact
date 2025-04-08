struct SDefault {
    a: Int = 7;
    b: Bool = true;
    c: String = "hey";
}

contract Test {
    s: SDefault;

    init() {
        self.s = SDefault{ };
    }
}