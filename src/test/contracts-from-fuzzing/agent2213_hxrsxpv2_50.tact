struct Mid {
    foo: Int?;
}

struct Top {
    m: Mid;
}

contract DefaultOptStruct {
    t: Top;

    init() {
        self.t = Top{
            m: Mid{ foo: null },
        };
    }
}
