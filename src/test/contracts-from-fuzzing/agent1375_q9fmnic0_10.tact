struct Inner {
    intVal: Int;
    stringVal: String;
}

struct Outer {
    optInner: Inner?;
    boolVal: Bool;
    cellVal: Cell;
}

contract NestedMixed {
    state: Outer;

    init() {
        self.state = Outer{
            optInner: null,
            boolVal: true,
            cellVal: emptyCell()
        };
    }
}