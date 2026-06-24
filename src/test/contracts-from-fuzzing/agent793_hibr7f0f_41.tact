struct Rec1 {
  a: Int;
}
struct Rec2 {
  b: Int;
}
struct Rec3 {
  c: Int;
}

contract EmbedDeeper {
    r1: Rec1;
    r2: Rec2;
    r3: Rec3;
    init() {
        self.r1 = Rec1{ a: 1 };
        self.r2 = Rec2{ b: 2 };
        self.r3 = Rec3{ c: 3 };
    }
}