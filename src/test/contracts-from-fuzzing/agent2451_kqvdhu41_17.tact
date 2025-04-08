struct MidNested {
    innerStr: String;
    flagOpt: Bool?;
}

contract StoreNested {
    rec: MidNested;

    init() {
        self.rec = MidNested{ innerStr: "x", flagOpt: null };
    }
}