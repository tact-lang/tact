struct S1 { x: Int; y: Int; }
struct S2 { s1: S1; z: Int; }

contract DeepPartialAssign {
    data: S2; 
    init() {
        self.data = S2{ s1: S1{ x: 5, y: 6 }, z: 7 };
        self.data.s1.y = 999;
    }
}