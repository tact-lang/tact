struct LargeNesting {
    a: Nested1;
}

struct Nested1 { b: Nested2; }
struct Nested2 { c: Nested3; }
struct Nested3 { d: Nested4; }
struct Nested4 { e: Nested5; }
struct Nested5 { val: Int; }

contract BigNest {
    v: LargeNesting;

    init() {
        self.v = LargeNesting{
            a: Nested1{
                b: Nested2{
                    c: Nested3{
                        d: Nested4{
                            e: Nested5{val:42}
                        }
                    }
                }
            }
        };
    }
}