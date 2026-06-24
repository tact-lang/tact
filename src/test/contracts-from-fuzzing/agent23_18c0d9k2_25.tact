struct Bottom {
    bval: Int;
}

struct Mid {
    mval: Int;
    child: Bottom;
}

struct Top {
    tval: Int;
    mid: Mid;
}

contract MultiLayered {
    all: Top;

    init() {
        self.all = Top{
            tval: 1,
            mid: Mid{
                mval: 2,
                child: Bottom{
                    bval:3
                }
            }
        };
    }
}