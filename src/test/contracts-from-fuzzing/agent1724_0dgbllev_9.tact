struct Sub1 {
    x: Int;
    y: Bool;
}
struct Sub2 {
    z: Int;
    w: Bool;
}

struct Both {
    s1: Sub1;
    s2: Sub2;
}

contract MultiNested {
    val: Both;
    init() {
        self.val = Both{
            s1: Sub1{ x: 1, y: false },
            s2: Sub2{ z: 2, w: true }
        };
    }
}