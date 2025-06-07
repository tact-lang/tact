struct Sub1 { a: Int }
struct Sub2 { b: Bool }

struct Combo {
    s1: Sub1;
    s2: Sub2;
}

contract NestTwoStructs {
    val: Combo;

    init() {
        self.val = Combo{
            s1: Sub1{a: 77},
            s2: Sub2{b: false}
        };
    }
}