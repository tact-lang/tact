struct InnerA {
    a: Int;
    b: Bool;
}

struct InnerB {
    c: String;
    d: Int?;
}

struct Outer {
    x: InnerA;
    y: InnerB;
    flag: Bool;
}

contract Test {
    nested: Outer = Outer{
        x: InnerA{a: 5, b: true},
        y: InnerB{c: "nested string", d: null},
        flag: false,
    };
}