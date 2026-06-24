struct StructA { x: Int; }
struct StructB { y: Int; a: StructA; }
struct StructC { z: Int; b: StructB; }

contract Composite {
    c: StructC;

    init() {
        self.c = StructC{
            z: 3,
            b: StructB{
                y: 2,
                a: StructA{ x: 1 }
            }
        };
    }
}
