struct NestedCombos {
    intVal: Int;
    boolVal: Bool?;
    strVal: String?;
}

contract MultiNested {
    c1: NestedCombos;
    c2: NestedCombos?;
    c3: NestedCombos?;

    init() {
        self.c1 = NestedCombos{ intVal:1, boolVal:null, strVal:null };
        self.c2 = null;
        self.c3 = null;
    }
}