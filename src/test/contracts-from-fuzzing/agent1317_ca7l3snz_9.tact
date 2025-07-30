struct MidOptional {
    a: Int;
    opt: InnerOptional?;
}

struct InnerOptional {
    b: Bool;
    c: String;
}

contract MidOptPersistent {
    field: MidOptional;

    init() {
        self.field = MidOptional{
            a: 9,
            opt: null
        };
    }
}