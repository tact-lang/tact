struct InnerLayer {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
}

contract NestedNullableOther {
    f1: InnerLayer?;
    f2: InnerLayer;

    init() {
        self.f1 = null;
        self.f2 = InnerLayer{ intVal: 1, boolVal: true, stringVal: "x" };
    }
}