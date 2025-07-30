struct SmallOpt {
    a: Int?;
    b: Bool?;
}

contract SmallOptionalStorage {
    s: SmallOpt;

    init() {
        self.s = SmallOpt{
            a: null,
            b: null,
        };
    }
}