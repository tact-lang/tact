struct OptionalDef {
    a: Int? = null;
    b: Bool? = null;
}

contract DefaultsOpt {
    data: OptionalDef;

    init() {
        self.data = OptionalDef{a:null,b:null};
    }
}