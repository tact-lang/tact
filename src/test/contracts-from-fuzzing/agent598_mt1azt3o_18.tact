struct InnerMost {
    data: Slice;
}

struct MidLayer {
    flag: Bool;
    inner: InnerMost;
}

struct OuterLayer {
    mid: MidLayer?;
    count: Int;
}

contract SliceMidOpt {
    state: OuterLayer;

    init() {
        self.state = OuterLayer{
            mid: MidLayer{
                flag: true,
                inner: InnerMost{ data: emptyCell().asSlice() }
            },
            count: 123
        };
    }
}