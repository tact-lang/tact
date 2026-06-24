contract LargeFlat {
    a: Int; b: Bool; c: String; d: Cell;
    e: Int; f: Bool; g: String; h: Cell;
    i: Int; j: Bool; k: String; l: Cell;

    init() {
        self.a=1; self.b=true; self.c="a"; self.d=emptyCell();
        self.e=2; self.f=false; self.g="b"; self.h=emptyCell();
        self.i=3; self.j=true; self.k="c"; self.l=emptyCell();
    }
}