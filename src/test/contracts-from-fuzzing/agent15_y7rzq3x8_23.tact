struct RecA { a: Int; }
struct RecB { b: Int; a: RecA; }
struct RecC { c: Int; b: RecB; }
struct RecD { d: Int; c: RecC; }

contract TestContract {
    crate: RecD;

    init() {
        self.crate = RecD{
            d: 1,
            c: RecC{
                c: 2,
                b: RecB{
                    b: 3,
                    a: RecA{
                        a: 4,
                    },
                },
            },
        };
    }
}