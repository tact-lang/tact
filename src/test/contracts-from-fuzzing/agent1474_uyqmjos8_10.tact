struct T1 { a: Int; }
struct T2 { t1: T1; b: Bool; }
struct T3 { t2: T2; s: String; }
struct T4 { t3: T3; c: Cell; }
struct T5 { t4: T4; sl: Slice; }

contract Test9b {
    deepChain: T5;
    init() {
        self.deepChain = T5{
            t4: T4{
                t3: T3{
                    t2: T2{
                        t1: T1{ a: 11 },
                        b: true
                    },
                    s: "deep"
                },
                c: emptyCell()
            },
            sl: emptyCell().asSlice()
        };
    }
}