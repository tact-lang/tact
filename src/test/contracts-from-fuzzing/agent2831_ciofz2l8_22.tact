struct DefOpt {
    a: Int = 5;
    b: Bool? = null;
    c: String = "yo";
}

contract ComplexOptDef {
    data: DefOpt?;

    init() {
        self.data = null;
    }
}
