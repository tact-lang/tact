struct InnerNested {
    intOpt: Int?;
    boolVal: Bool;
}
struct MidNested {
    inner: InnerNested?;
    str: String;
}

contract PersistMixedDeep {
    x: MidNested?;
    y: MidNested;

    init() {
        self.x = null;
        self.y = MidNested{ inner: null, str: "hi" };
    }
}