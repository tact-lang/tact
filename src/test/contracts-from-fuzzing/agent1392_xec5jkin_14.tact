struct A { x: Int?; }
struct B { y: Int?; a: A; }
struct C { z: Int?; b: B; }

contract OptionalNest {
    data: C;

    init() {
        self.data = C{
            z:null,
            b:B{
                y:null,
                a:A{ x:null }
            }
        };
    }
}