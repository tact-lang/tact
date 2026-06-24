struct Nested1 { a: Int }
struct Nested2 { n1: Nested1 }
struct Nested3 { n2: Nested2 }
struct Nested4 { n3: Nested3 }
struct Nested5 { n4: Nested4 }

contract SuperDeep {
    v: Nested5;
    init() {
        self.v = Nested5{
            n4:Nested4{
                n3:Nested3{
                    n2:Nested2{
                        n1:Nested1{a:123}
                    }
                }
            }
        };
    }
}