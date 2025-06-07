struct Combo {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
}

contract ManyFieldsContract {
    f1: Int;
    f2: Bool;
    f3: Combo;
    f4: String;
    f5: Bool?;

    init() {
        self.f1 = 42;
        self.f2 = false;
        self.f3 = Combo{ intVal: 55, boolVal: true, stringVal: "abc" };
        self.f4 = "def";
        self.f5 = null;
    }
}