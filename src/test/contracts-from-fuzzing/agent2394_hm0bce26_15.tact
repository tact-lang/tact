struct Nested1 { a: Int; }
struct Nested2 { b: Nested1; }
struct Nested3 { c: Nested2; }
struct Nested4 { d: Nested3; }
struct Nested5 { e: Nested4; }
struct Nested6 { f: Nested5; }

contract CrazyDepth {
    n6: Nested6;

    init() {
        self.n6 = Nested6{
            f: Nested5{
                e: Nested4{
                    d: Nested3{
                        c: Nested2{
                            b: Nested1{ a: 777 }
                        }
                    }
                }
            }
        };
    }
}
