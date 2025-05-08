struct S1 {
    s: String;
}

struct S2 {
    v: Int;
    s: S1?;
}

contract OptionalStringStruct {
    f: S2;

    init() {
        self.f = S2{ v:1, s:null };
    }
}