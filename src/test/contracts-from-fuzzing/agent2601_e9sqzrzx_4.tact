struct A {
    a1: Int;
    a2: Bool;
    a3: String;
}
struct B {
    b1: Int;
    b2: Bool;
    b3: String;
    nestedA: A;
}
struct C {
    c1: Int;
    c2: Bool;
    c3: String;
    nestedB: B;
}

contract ABCNested {
    data: C;
    init() {
        self.data = C{
            c1: 1, c2: true, c3: "c",
            nestedB: B{
                b1: 2, b2: false, b3: "b",
                nestedA: A{ a1:3, a2:true, a3:"a" }
            }
        };
    }
}