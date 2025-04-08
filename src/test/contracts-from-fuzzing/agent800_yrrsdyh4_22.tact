struct EmptyDefOpt {
    v1: Int?;
    v2: Bool?;
    v3: String?;
    v4: Cell?;
    v5: Slice?;
    v6: Builder?;
    v7: Address?;
}

contract EmptyOptDefaults {
    st: EmptyDefOpt;
    init() {
        self.st = EmptyDefOpt{};
    }
}