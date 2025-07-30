struct InnerMost {
    z: Int?;
}

struct Inner {
    innerMostOpt: InnerMost?;
}

struct Mid {
    innerOpt: Inner?;
}

struct Top {
    midOpt: Mid?;
    val: Int;
}

contract TestContract {
    data: Top;
    init() {
        self.data = Top{
            midOpt: null,
            val: 99
        };
    }
}