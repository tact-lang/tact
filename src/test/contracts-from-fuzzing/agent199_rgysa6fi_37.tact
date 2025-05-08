struct Msg1 { a: Int; }
struct Msg2 { b: Bool; }

struct Combo {
    m1: Msg1;
    m2: Msg2;
}

contract MultipleStructsSameLevel {
    data: Combo;

    init() {
        self.data = Combo{
            m1: Msg1{a:42},
            m2: Msg2{b:true},
        };
    }
}
