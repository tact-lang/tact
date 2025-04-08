struct SingleBool {
    ok: Bool;
}

contract ManySingleStructs {
    a: SingleBool;
    b: SingleBool;
    c: SingleBool;
    d: SingleBool;
    e: SingleBool;

    init() {
        self.a = SingleBool{ok:true};
        self.b = SingleBool{ok:false};
        self.c = SingleBool{ok:true};
        self.d = SingleBool{ok:false};
        self.e = SingleBool{ok:true};
    }
}