struct TinyA { a: Int }
struct TinyB { b: Bool }
struct TinyC { c: String }

contract InlineCompose {
    s1: TinyA;
    s2: TinyB;
    s3: TinyC;

    init() {
        self.s1 = TinyA{ a: 1 };
        self.s2 = TinyB{ b: true };
        self.s3 = TinyC{ c: "z" };
    }
}