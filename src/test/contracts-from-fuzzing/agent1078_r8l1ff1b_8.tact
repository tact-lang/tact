struct Sub {
    flag: Bool;
    value: Int as uint8;
}

struct Middle {
    optSub: Sub?;
    id: Int;
}

struct Top {
    mid: Middle;
    hash: String;
}

contract DeepOpts {
    data: Top;

    init() {
        self.data = Top{
            mid: Middle{
                optSub: null,
                id: 99
            },
            hash: "testhash"
        };
    }
}