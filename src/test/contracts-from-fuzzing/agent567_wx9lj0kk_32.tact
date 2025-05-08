// test empty optional nested inside populated optional
struct Leaf {
    value: Int = 5;
}

struct Middle {
    leaf: Leaf?;
}

struct Outer {
    mid: Middle?;
}

contract DeepPenguin {
    val: Outer?;
    init() {
        self.val = Outer {
            mid: Middle{
                leaf: null
            }
        };
    }
}
