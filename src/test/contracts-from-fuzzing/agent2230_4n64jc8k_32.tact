// big nested mix optionals with various primitive fields
struct A {
    a: Int;
    b: Bool?;
    c: String?;
}

struct B {
    d: Int?;
    e: A?;
    f: Bool;
}

struct C {
    g: B?;
    h: A;
    i: String;
}

contract BigMixNested {
    root: C;
    init() {
        self.root = C{
            g: B{ d:null, e: null, f:true },
            h: A{ a:123, b:null, c:"x" },
            i: "yyy"
        };
    }
}