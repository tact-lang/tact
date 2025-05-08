struct Nested1 { a: Int; } 
struct Nested2 { n1: Nested1; } 
struct Nested3 { n2: Nested2; } 
struct Nested4 { n3: Nested3; } 

contract DeepChainNested {
    deep: Nested4;

    init() {
        self.deep = Nested4{
            n3: Nested3{
                n2: Nested2{
                    n1: Nested1{ a: 777 }
                }
            }
        };
    }
}
