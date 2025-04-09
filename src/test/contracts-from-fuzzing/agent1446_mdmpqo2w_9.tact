struct AAA { a: Int }
struct BBB { b: Int }
struct CCC { c: Int }
struct DDD { d: Int }

struct EEE {
    a1: AAA;
    b1: BBB;
    c1: CCC;
    d1: DDD;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract Test {
    data: EEE;

    init() {
        self.data = EEE{
            a1: AAA{a: 1},
            b1: BBB{b: 2},
            c1: CCC{c: 3},
            d1: DDD{d: 4},
            optInt: null,
            optBool: true,
            optString: "opt",
        };
    }
}
