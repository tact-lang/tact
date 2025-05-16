struct DefOptMix {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
    d: Int = 5;
    e: String = "s";
    f: Bool = true;
}

contract DefOptStructs {
    s: DefOptMix;

    init() {
        self.s = DefOptMix{
        };
    }
}
