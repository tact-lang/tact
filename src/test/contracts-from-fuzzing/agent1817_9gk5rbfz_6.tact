struct InnerA {
    intVal: Int;
    boolVal: Bool;
}

struct InnerB {
    stringVal: String;
    cellVal: Cell;
}

struct Parent {
    a: InnerA;
    b: InnerB;
}

contract MultiNestedTest {
    state: Parent;

    init() {
        self.state = Parent{
            a: InnerA{ intVal: 5, boolVal: true },
            b: InnerB{ stringVal: "hi", cellVal: emptyCell() },
        };
    }
}
