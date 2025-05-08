struct A {
    val1: Int;
}

struct B {
    val2: Bool;
}

struct C {
    innerA: A;
    innerB: B;
    text: String;
}

contract MultiNest {
    data: C;

    init() {
        self.data = C{
            innerA: A{val1: 10},
            innerB: B{val2: false},
            text: "ok"
        };
    }
}