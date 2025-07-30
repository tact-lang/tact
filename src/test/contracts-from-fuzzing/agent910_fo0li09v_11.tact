struct Innermost { x: Int; }

struct Mid1 { a: Innermost; }
struct Mid2 { b: Innermost; }
struct Mid3 { c: Innermost; }

struct Wrap {
    m1: Mid1;
    m2: Mid2;
    m3: Mid3;
}

contract MultipleNested {
    nested: Wrap;

    init() {
        self.nested = Wrap{
            m1: Mid1{a: Innermost{x:1}},
            m2: Mid2{b: Innermost{x:2}},
            m3: Mid3{c: Innermost{x:3}}
        };
    }
}