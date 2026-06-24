struct InnerDef {
    flag: Bool = true;
    txt: String = "hey";
}

contract DefaultsDeep {
    inn: InnerDef;
    init() {
        self.inn = InnerDef{};
    }
}