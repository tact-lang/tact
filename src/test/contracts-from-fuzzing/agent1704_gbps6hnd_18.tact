struct Outer {
    nestedA: A;
    nestedB: B;
}

struct A {
    x: Int;
    y: Bool;
}

struct B {
    m: String;
    n: Bool;
}

contract ManyNested {
    s: Outer;

    init() {
        self.s = Outer{
            nestedA: A{ x: 1, y: true },
            nestedB: B{ m: "Bstruct", n: false },
        };
    }
}