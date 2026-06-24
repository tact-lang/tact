struct Combo {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    a: Int;
    b: String;
    c: Bool;
}

contract CrossReference {
    field: Combo;

    init() {
        self.field = Combo{ inner: Inner{ a:1,b:"s",c:true }, flag:false };
    }
}