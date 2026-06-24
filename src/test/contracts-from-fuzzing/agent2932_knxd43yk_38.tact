contract DefaultsAndOptionals {
    a: Int = 5;
    b: Bool? = null;
    c: String? = null;
    d: Cell? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "done";
        self.d = emptyCell();
    }
}