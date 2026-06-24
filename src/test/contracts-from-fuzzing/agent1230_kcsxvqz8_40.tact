struct Nested1 { a: Int; }
struct Nested2 { b: Nested1; }
struct Nested3 { c: Nested2; }
struct Nested4 { d: Nested3; }
struct Nested5 { e: Nested4; }
struct Nested6 { f: Nested5; }

contract NestedSix {
    val: Nested6;

    init() {
        self.val = Nested6{
            f: Nested5{
                e: Nested4{
                    d: Nested3{
                        c: Nested2{
                            b: Nested1{ a: 99 }
                        }
                    }
                }
            }
        };
    }
}