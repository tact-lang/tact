struct StrNest1 { a: String; }
struct StrNest2 { b: StrNest1; }

struct StrNest3 {
    c: StrNest2;
    d: Bool?;
}

contract StringNested {
    nested: StrNest3;
    init() {
        self.nested = StrNest3{
            c: StrNest2{ b: StrNest1{ a: "hello" } },
            d: true
        };
    }
}