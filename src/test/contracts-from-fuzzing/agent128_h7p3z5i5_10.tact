struct A {
    intVal: Int;
    boolVal: Bool;
}

struct B {
    strVal: String;
    nestedA: A;
}

struct C {
    cellVal: Cell;
    nestedB: B;
}

contract DeepChain {
    c: C;

    init() {
        self.c = C{
            cellVal: emptyCell(),
            nestedB: B{
                strVal: "hi",
                nestedA: A{ intVal: 5, boolVal: true }
            }
        };
    }
}