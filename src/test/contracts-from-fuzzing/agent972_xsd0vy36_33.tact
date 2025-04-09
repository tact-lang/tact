struct RecA { f: Int?; }
struct RecB { g: Bool?; }
struct RecC { h: String?; }

contract ComplexMixOpt {
    a: RecA?;
    b: RecB?;
    c: RecC?;
    s: String?;

    init() {
        self.a = RecA{ f: null };
        self.b = null;
        self.c = RecC{ h: null };
        self.s = null;
    }
}