struct EmptyStrDef {
    name: String = "";
}

contract EmptyStrDefault {
    s: EmptyStrDef;
    init() {
        self.s = EmptyStrDef{};
    }
}