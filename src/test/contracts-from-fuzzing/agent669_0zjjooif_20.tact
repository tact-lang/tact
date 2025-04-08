struct Mid {
    i: Int;
}

struct Top {
    optMid: Mid?;
}

contract OptionalIntermediate {
    val: Top;

    init() {
        self.val = Top{
            optMid: null
        };
    }
}