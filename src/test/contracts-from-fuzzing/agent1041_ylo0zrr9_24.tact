struct StructA {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract ManySeparates {
    field1: StructA;
    field2: StructA;
    field3: StructA;
    field4: StructA;

    init() {
        self.field1 = StructA{ intVal: 1, boolVal: true, strVal: "one" };
        self.field2 = StructA{ intVal: 2, boolVal: false, strVal: "two" };
        self.field3 = StructA{ intVal: 3, boolVal: true, strVal: "three" };
        self.field4 = StructA{ intVal: 4, boolVal: false, strVal: "four" };
    }
}
