struct In1 { a: Int; }
struct In2 { b: Bool; }
struct In3 { c: String; }

contract ComposeStructs {
    s1: In1;
    s2: In2;
    s3: In3;
    init() {
        self.s1 = In1{ a: 6 };
        self.s2 = In2{ b: false };
        self.s3 = In3{ c: "z" };
    }
}