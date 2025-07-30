struct DefNested {
    inner: InnerDef;
}

struct InnerDef {
    val: Int = 42;
}

contract TestContract {
    dn: DefNested;

    init() {
        self.dn = DefNested{ inner: InnerDef{} };
    }
}