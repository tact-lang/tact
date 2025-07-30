struct Defs {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
}

contract OptDef {
    data: Defs;
    init() {
        self.data = Defs{};
    }
}