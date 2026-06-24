struct Nest1 { i: Int; }
struct Nest2 { x: Nest1; }
struct Nest3 { y: Nest2; }

contract TripleNest {
    z: Nest3;

    init() {
        self.z = Nest3{
            y: Nest2{
                x: Nest1{ i: 7 }
            }
        };
    }
}
