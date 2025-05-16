struct X {
    n: Int as int64;
    flag: Bool;
}

struct Y {
    x: X?;
    msg: String = "hi";
    numOpt: Int?;
}

contract FullMix {
    data: Y;

    init() {
        self.data = Y{
            x: X{ n: 42, flag: true },
            msg: "custom",
            numOpt: null
        };
    }

    receive() {}
}
