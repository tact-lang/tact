struct Nested1 { f1: Int; }
struct Nested2 { nested1: Nested1; f2: Int; }
struct Nested3 { nested2: Nested2; f3: Int; }
struct Nested4 { nested3: Nested3; f4: Int; }

contract NestedFourLayers {
    data: Nested4;

    init() {
        self.data = Nested4{
            nested3: Nested3{
                nested2: Nested2{
                    nested1: Nested1{
                        f1: 1
                    },
                    f2: 2
                },
                f3: 3
            },
            f4: 4
        };
    }
}