struct AOptional {
    s: Int?;
    b: Bool?;
    c: Cell?;
    str: String?;
}

contract OptFields {
    data: AOptional;

    init() {
        self.data = AOptional{
            s: null,
            b: null,
            c: null,
            str: null,
        };
    }
}