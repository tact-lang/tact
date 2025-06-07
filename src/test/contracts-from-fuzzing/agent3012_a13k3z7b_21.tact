// Large contract with mixed types and nesting
struct S1 {
    foo: Int;
    bar: Bool;
}

struct S2 {
    inner: S1;
    txt: String;
    opt: Int?;
}

contract MixedLarge {
    f1: S2;
    f2: S1;
    f3: Int;
    f4: Bool?;
    f5: String;

    init() {
        self.f1 = S2{ inner:S1{foo:1, bar:true}, txt:"x", opt:null };
        self.f2 = S1{ foo:2, bar:false };
        self.f3 = 3;
        self.f4 = null;
        self.f5 = "y";
    }
}