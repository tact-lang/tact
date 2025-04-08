struct Inner1 { foo: Int; }
struct Inner2 { bar: Bool; }
struct Inner3 { baz: Int; }

struct Combo {
    a: Inner1;
    b: Inner2;
    c: Inner3;
}

contract Test {
    combo: Combo = Combo{
        a: Inner1{foo: 1},
        b: Inner2{bar: true},
        c: Inner3{baz: 42}
    };
}