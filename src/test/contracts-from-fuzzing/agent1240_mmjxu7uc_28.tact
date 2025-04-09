contract OptionalDeepWrap {
    outer: S;

    init() {
        self.outer = S{
            mid: Mid{
                optMsg: null
            }
        };
    }
}

struct S {
    mid: Mid;
}

struct Mid {
    optMsg: InnerMsg?;
}

message(99) InnerMsg {
    x: Int?;
}
