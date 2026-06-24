struct TinyOptional {
    f: Bool?;
}

contract ManyTinyOptionalStructs {
    a: TinyOptional;
    b: TinyOptional;
    c: TinyOptional;
    d: TinyOptional;
    init() {
        self.a = TinyOptional{f: null};
        self.b = TinyOptional{f: null};
        self.c = TinyOptional{f: null};
        self.d = TinyOptional{f: null};
    }
}