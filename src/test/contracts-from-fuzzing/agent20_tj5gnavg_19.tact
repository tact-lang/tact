struct IntBoolTuple {
    intVal: Int;
    boolVal: Bool;
}

contract TupleArrayStyle {
    t1: IntBoolTuple;
    t2: IntBoolTuple;

    init() {
        self.t1 = IntBoolTuple{ intVal: 51, boolVal: false };
        self.t2 = IntBoolTuple{ intVal: 52, boolVal: true };
    }
}