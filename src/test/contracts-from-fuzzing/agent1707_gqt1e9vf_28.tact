struct OptStructDefault {
    v: Int? = null;
}

contract OptDef {
    st: OptStructDefault;

    init() {
        self.st = OptStructDefault{ v: null };
    }
}