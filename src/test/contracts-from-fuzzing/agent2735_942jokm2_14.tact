struct SOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct SHolder {
    inner: SOptional;
    note: String;
    ok: Bool;
}

contract OptInStruct {
    data: SHolder;

    init() {
        self.data = SHolder{
            inner: SOptional{ a:null, b:null, c:null },
            note: "hey",
            ok: true,
        };
    }
}
