// test default nested struct values
struct DefS {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract DefNested {
    st: DefS;

    init() {
        self.st = DefS{};
    }
}