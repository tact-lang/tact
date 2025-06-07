struct Nested1 { a: Int?; b: String = ""; }
struct Nested2 { c: Bool = false; d: Slice?; }

contract ComplexInterleaved {
    n1: Nested1;
    opt1: Int? = null;
    opt2: Bool?;
    str1: String = "hello";
    n2: Nested2;

    init() {
        self.n1 = Nested1{ a:null, b:"xyz" };
        self.opt1 = null;
        self.opt2 = null;
        self.str1 = "world";
        self.n2 = Nested2{ c: true, d: null };
    }
}