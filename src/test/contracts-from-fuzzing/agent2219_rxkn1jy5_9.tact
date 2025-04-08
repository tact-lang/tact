struct Opt1 { a: Int?; }
struct Opt2 { b: Bool?; }
struct Opt3 { c: String?; }

contract OptionalMix {
    o1: Opt1;
    o2: Opt2;
    o3: Opt3;

    init() {
        self.o1 = Opt1{ a: null };
        self.o2 = Opt2{ b: null };
        self.o3 = Opt3{ c: null };
    }
}