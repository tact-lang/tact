struct Sub1 { a: Int }
struct Sub2 { b: Sub1 }
struct Sub3 { c: Sub2 }

struct EmbedMany {
    e0: Int;
    e1: Sub3;
    e2: Int;
    e3: Sub3;
    e4: Int;
}

contract ManyEmbedded {
    val: EmbedMany;
    init() {
        self.val = EmbedMany{
            e0: 0,
            e1: Sub3{ c: Sub2{ b: Sub1{ a:11 } } },
            e2: 2,
            e3: Sub3{ c: Sub2{ b: Sub1{ a:33 } } },
            e4: 4
        };
    }
}