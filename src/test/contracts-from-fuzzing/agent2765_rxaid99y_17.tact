struct SubDef {
    s: String = "default";
    b: Bool = false;
}

contract DefaultsNested {
    sub: SubDef;

    init() {
        self.sub = SubDef{};
    }
}