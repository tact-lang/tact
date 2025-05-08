struct S {
    intVal: Int;
}

contract DuplicateStructFields {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{ intVal: 10 };
        self.s2 = S{ intVal: 20 };
    }
}
