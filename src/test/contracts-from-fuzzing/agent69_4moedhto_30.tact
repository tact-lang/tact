contract DefaultsAndAssigns {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";

    init() {
        self.a = 50;
        self.b = false;
        self.c = "changed";
    }
}