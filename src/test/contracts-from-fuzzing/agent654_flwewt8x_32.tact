struct S1 { a: Int }
struct S2 { a: Int }
struct Combo {
    s1: S1?;
    s2: S2?;
}
contract TestContract {
    combo: Combo;
    init() {
        self.combo = Combo{ s1:null, s2:null };
    }
}