struct Deep {
    n1: Int;
    s1: String;
    b1: Bool;
}

contract MultipleTypes {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
    nested: Deep;

    init() {
        self.intVal = 1;
        self.strVal = "test";
        self.boolVal = true;
        self.nested = Deep{n1: 2, s1: "s", b1: false};
    }
}