struct A {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    nestedB: B;
    optB: B?;
}

struct B {
    x: Int;
    y: Bool;
    text: String;
    nestedC: C;
}

struct C {
    flag: Bool;
    optStr: String?;
}

contract TestChain {
    state: A;

    init() {
        self.state = A{
            intVal: 1,
            boolVal: false,
            stringVal: "hi",
            nestedB: B{
                x: 2, y: true, text: "inner",
                nestedC: C{ flag: false, optStr: null }
            },
            optB: null,
        };
    }
}