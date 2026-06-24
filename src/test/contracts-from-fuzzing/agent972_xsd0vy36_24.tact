struct PrimFields {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract ManyPrimFields {
    f1: PrimFields;
    f2: PrimFields;
    f3: PrimFields;

    init() {
        self.f1 = PrimFields{ intVal: 1, boolVal: true, strVal: "abc" };
        self.f2 = PrimFields{ intVal: 2, boolVal: false, strVal: "def" };
        self.f3 = PrimFields{ intVal: 3, boolVal: true, strVal: "ghi" };
    }
}
