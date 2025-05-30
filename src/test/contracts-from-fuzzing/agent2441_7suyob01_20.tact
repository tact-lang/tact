struct Middle {
    foo: Int?;
}

struct Top {
    middle: Middle?;
    bar: Int;
}

contract OptMiddle {
    val: Top;

    init() {
        self.val = Top{
            middle: null,
            bar: 42,
        };
    }
}