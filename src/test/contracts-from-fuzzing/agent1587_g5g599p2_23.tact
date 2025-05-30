struct One { x: Int; }
struct Two { y: Int; }
struct Three { z: Int; }
struct Four { w: Int; }

struct Combo4 {
    first: One;
    second: Two;
    third: Three;
    fourth: Four;
}

contract WideNested {
    val: Combo4;

    init() {
        self.val = Combo4{
            first: One{x: 1},
            second: Two{y: 2},
            third: Three{z: 3},
            fourth: Four{w: 4}
        };
    }
}