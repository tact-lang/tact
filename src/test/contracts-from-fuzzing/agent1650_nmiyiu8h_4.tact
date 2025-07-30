struct InnerMost {
    z: Int as uint16;
}

struct Mid {
    middleVal: Int;
    inner: InnerMost;
}

struct Top {
    name: String;
    mid: Mid;
    flag: Bool;
}

contract NestedStructsChain {
    topStruct: Top;

    init() {
        self.topStruct = Top{
            name: "test",
            mid: Mid{
                middleVal: 42,
                inner: InnerMost{
                    z: 999,
                },
            },
            flag: true,
        };
    }
}