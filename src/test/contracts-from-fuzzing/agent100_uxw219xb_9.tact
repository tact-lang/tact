struct BigNested1 { a: Int; }
struct BigNested2 { nested1: BigNested1; b: Int; }
struct BigNested3 { nested2: BigNested2; c: Int; }
struct BigNested4 { nested3: BigNested3; d: Int; }
struct BigNested5 { nested4: BigNested4; e: Int; }

contract BigDeepChain {
    data: BigNested5;

    init() {
        self.data = BigNested5{
            nested4: BigNested4{
                nested3: BigNested3{
                    nested2: BigNested2{
                        nested1: BigNested1{ a: 1 },
                        b: 2
                    },
                    c: 3
                },
                d: 4
            },
            e: 5
        };
    }
}