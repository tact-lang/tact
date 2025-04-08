struct EmptyOptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllNullsByDef {
    s: EmptyOptDefaults;

    init() {
        self.s = EmptyOptDefaults{
            a:null,
            b:null,
            c:null
        };
    }
}