struct S1 { x: Int; y: Bool; }
struct S2 { z: String; }

contract Combo {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{ x: 10, y: false };
        self.s2 = S2{ z: "hi" };
    }
}
