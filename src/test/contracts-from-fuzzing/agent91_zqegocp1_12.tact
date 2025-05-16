struct A { x: Int } 
struct B { y: A } 
struct C { z: B } 

contract Test {
    nested: C;

    init() {
        self.nested = C{
            z: B{
                y: A{
                    x: 123
                }
            }
        };
    }
}