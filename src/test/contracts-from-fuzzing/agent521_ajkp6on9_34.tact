struct S {
    intVal: Int;
    strVal: String?;
}

contract ManyDefaults {
    x: S = S{ intVal: 1, strVal: null };
    y: S = S{ intVal: 2, strVal: "hi" };

    init() {
        self.x = S{ intVal:3, strVal:"yo" };
        self.y = S{ intVal:4, strVal:null };
    }
}