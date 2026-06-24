struct OverlapA { x: Int; y: Int; }
struct OverlapB { y: Int; z: Int; }

struct Merged {
    a: OverlapA; b: OverlapB;
}

contract OverlappingNested {
    val: Merged;
    init() {
        self.val = Merged{
            a: OverlapA{x:1,y:2},
            b: OverlapB{y:3,z:4}
        };
    }
}