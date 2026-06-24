// test contract with a lot of primitive fields, some optional
contract WidePrimitives {
    a: Int; b: Int?; c: Int;
    d: Bool; e: Bool?; f: Bool;
    g: String; h: String?; i: String;
    j: Address; k: Cell;

    init() {
        self.a = 1;  self.b = null; self.c = 2;
        self.d = true; self.e = null; self.f = false;
        self.g = "a"; self.h = null; self.i = "b";
        self.j = myAddress(); self.k = emptyCell();
    }
}