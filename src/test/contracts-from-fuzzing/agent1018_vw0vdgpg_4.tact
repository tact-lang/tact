struct Child1 {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
}

struct Child2 {
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;
}

struct Parent {
    child1: Child1;
    child2: Child2;
    anotherInt: Int;
}

contract ComboTypes {
    storage: Parent;

    init() {
        self.storage = Parent{
            child1: Child1{ intVal: 7, boolVal: true, stringVal: "s" },
            child2: Child2{ cellVal: emptyCell(), sliceVal: emptyCell().asSlice(), addressVal: myAddress() },
            anotherInt: 8,
        };
    }
}