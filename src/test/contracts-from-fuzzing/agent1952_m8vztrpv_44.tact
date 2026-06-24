struct DeepLeaf {
    num: Int?;
    txt: String?;
    data: Slice?;
    addr: Address?;
}

struct MidLevel {
    dl: DeepLeaf?;
    flag: Bool?;
}

struct TopLevel {
    mid: MidLevel?;
    mainFlag: Bool;
}

contract DeepTest {
    store: TopLevel;

    init() {
        self.store = TopLevel{
            mid: MidLevel{
                dl: null,
                flag: true,
            },
            mainFlag: false,
        };
    }
}
