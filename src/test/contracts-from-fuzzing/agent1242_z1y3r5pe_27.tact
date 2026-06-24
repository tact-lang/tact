// Many optionals with mixing default values
struct OptDef {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = null;
    e: String?;
    f: String? = null;
}

contract Test {
    s: OptDef;

    init() {
        self.s = OptDef{
            a: null,
            c: null,
            e: null,
        };
    }
}
