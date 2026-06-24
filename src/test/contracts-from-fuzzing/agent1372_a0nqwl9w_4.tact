struct BigInner {
    x: Int;
    y: Bool;
    s: String;
    c: Cell;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: String;
    f: Int;
    g: Bool;
    h: BigInner;
    
    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = emptyCell();
        self.e = "bye";
        self.f = 42;
        self.g = false;
        self.h = BigInner{
            x: 9,
            y: true,
            s: "nested",
            c: emptyCell(),
        };
    }
}