struct DefOpt {
    x: Int? = null;
    y: Bool? = true;
    s: String? = "ok";
}

contract OptionalDef {
    rec: DefOpt;
    init() {
        self.rec = DefOpt{};
    }
}