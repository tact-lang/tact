struct ManyOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Int? = null;
    f: Bool? = null;
    g: String? = null;
    h: Address? = null;
    i: Int? = null;
    j: Bool? = null;
    k: String? = null;
    l: Address? = null;
}

contract TestContract {
    mo: ManyOptionals;

    init() {
        self.mo = ManyOptionals{};
    }
}
