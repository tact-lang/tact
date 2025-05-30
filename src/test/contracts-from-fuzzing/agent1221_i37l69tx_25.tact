struct SubA { x: Int }
struct SubB { y: Int }
struct SubC { z: Int }

struct Mega {
    a: SubA;
    b: SubB;
    c: SubC;
}

contract MultiNested {
    val: Mega;

    init() {
        self.val = Mega{
            a: SubA{ x: 1 },
            b: SubB{ y: 2 },
            c: SubC{ z: 3 }
        };
    }
}