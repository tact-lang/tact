struct S1 { a: Int; b: String; }
struct S2 { flag: Bool; num: Int; }

contract MultiComposite {
    s1: S1;
    s2opt: S2?;

    init() {
        self.s1 = S1{a: 9, b: "nine"};
        self.s2opt = S2{flag:true, num:88};
    }
}