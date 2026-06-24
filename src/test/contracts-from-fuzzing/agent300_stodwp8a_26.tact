struct Deep {
    val: Int as uint8;
}

struct Mid {
    deepOpt: Deep?;
}

struct Top {
    midOpt: Mid?;
    flag: Bool;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            midOpt: null,
            flag: true,
        };
    }
}