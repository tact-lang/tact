contract ContractManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: map<Int, Int>;
    f: map<Address, Int>;
    g: Outer;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = null;
        self.e = emptyMap();
        self.f = emptyMap();
        self.g = Outer{
            x: 0,
            y: Inner{p: 1, q: null}
        };
    }
}

struct Inner {
    p: Int;
    q: Bool?;
}
struct Outer {
    x: Int;
    y: Inner;
}