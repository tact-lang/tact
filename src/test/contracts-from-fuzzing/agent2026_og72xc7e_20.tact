struct Inner {
    optA: Int?;
    optB: Bool?;
    optC: String?;
}

struct Middle {
    inner1: Inner?;
    inner2: Inner?;
}

contract TestContract {
    deepOpt: Middle;

    init() {
        self.deepOpt = Middle{
            inner1: Inner{
                optA: null,
                optB: null,
                optC: null
            },
            inner2: null
        };
    }
}