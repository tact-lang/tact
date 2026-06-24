struct ManyOptions {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: String?;
    o5: String?;
    o6: Bool?;
    o7: Bool?;
}

contract LotsOpt {
    mf: ManyOptions;

    init() {
        self.mf = ManyOptions{
            o1: null,
            o2: 2,
            o3: null,
            o4: null,
            o5: "hi",
            o6: true,
            o7: null
        };
    }
}