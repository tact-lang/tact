struct OptionalsDeep {
    v1: Int?;
    v2: Bool?;
    v3: String?;
    v4: Address?;
    v5: Cell?;
    v6: Slice?;
}

contract OptionalsTest {
    data: OptionalsDeep;

    init() {
        self.data = OptionalsDeep{
            v1: null,
            v2: null,
            v3: null,
            v4: null,
            v5: null,
            v6: null,
        };
    }
}
