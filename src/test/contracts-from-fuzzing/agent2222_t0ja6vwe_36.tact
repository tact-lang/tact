contract BigCombo {
    a: Int?;
    b: Bool;
    c: String?;
    d: Cell;
    e: Bool?;
    f: Int;
    g: String;

    init() {
        self.a=null; self.b=true; self.c=null; self.d=emptyCell();
        self.e=true; self.f=42; self.g="done";
    }
}