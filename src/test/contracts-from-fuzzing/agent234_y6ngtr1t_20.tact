struct Seq1 {
    x: Int;
}
struct Seq2 {
    s: String;
}
struct Seq3 {
    b: Bool;
}
contract SeqTest {
    a: Seq1;
    b: Seq2;
    c: Seq3;
    d: Int?;

    init() {
        self.a = Seq1{x:1};
        self.b = Seq2{s:"abc"};
        self.c = Seq3{b:true};
        self.d = null;
    }
}