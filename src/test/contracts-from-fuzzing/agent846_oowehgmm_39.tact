struct Z {
    zz: Int as uint32 = 1234;
    optFlag: Bool? = null;
}

struct Y {
    yVal: Int as int16;
    zOpt: Z?;
}

struct X {
    name: String;
    yOpt: Y?;
    score: Int?;
}

contract Test {
    data: X?;

    init() {
        self.data = X {
            name: "test",
            yOpt: Y{
                yVal: -2000,
                zOpt: Z {}
            },
            score: null
        };
    }
}