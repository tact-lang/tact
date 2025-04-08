struct Deep3 {
    c: String;
}

struct Deep2 {
    b: Deep3;
}

struct Deep1 {
    a: Deep2;
}

contract TripleNestedStruct {
    s: Deep1;

    init() {
        self.s = Deep1{ a: Deep2{ b: Deep3{ c: "ok" } } };
    }
}