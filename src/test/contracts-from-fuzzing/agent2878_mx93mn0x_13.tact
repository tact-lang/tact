struct MultiDeep1 { a: Int; }
struct MultiDeep2 { a1: MultiDeep1; a2: MultiDeep1; }
struct MultiDeep3 { b1: MultiDeep2; b2: MultiDeep2; }

contract TestContract {
    data: MultiDeep3;

    init() {
        self.data = MultiDeep3{
            b1: MultiDeep2{
                a1: MultiDeep1{ a: 1 },
                a2: MultiDeep1{ a: 2 }
            },
            b2: MultiDeep2{
                a1: MultiDeep1{ a: 3 },
                a2: MultiDeep1{ a: 4 }
            }
        };
    }
}