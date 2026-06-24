struct Msg1 { a: Int }
struct Msg2 { b: Bool }

struct Comb {
    m1: Msg1;
    m2: Msg2;
    text: String;
    oNum: Int?;
}

contract NestedMix {
    s: Comb;

    init() {
        self.s = Comb{
            m1: Msg1{a:1},
            m2: Msg2{b:true},
            text: "hi",
            oNum: null
        };
    }
}