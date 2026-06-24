struct Outer {
    nested1: Nested1;
    nested2: Nested2;
}

struct Nested1 {
    a: Int;
    b: Bool;
}

struct Nested2 {
    c: String;
    d: Bool?;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            nested1: Nested1{ a:1, b:true },
            nested2: Nested2{ c:"hi", d:null },
        };
    }
}