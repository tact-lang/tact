struct Embedded {
    num: Int;
    flag: Bool;
}

struct SComplex {
    a: Int;
    s: Embedded;
    c: Bool;
}

contract EmbedTest {
    e: SComplex;

    init() {
        self.e = SComplex{ a:1, s:Embedded{ num:2, flag:true }, c:false };
    }
}