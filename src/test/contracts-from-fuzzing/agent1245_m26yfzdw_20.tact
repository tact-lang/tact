struct MultiLayer {
    top: Int;
    mid: Middle;
}

struct Middle {
    num: Int;
    inner: Bottom;
    flag: Bool;
}

struct Bottom {
    x: Int;
    y: Int;
}

contract BigNest {
    val: MultiLayer;

    init() {
        self.val = MultiLayer{
            top: 1,
            mid: Middle{
                num: 2,
                inner: Bottom{ x:3, y:4 },
                flag: true
            }
        };
    }
}
