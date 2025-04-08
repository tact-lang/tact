struct LargeOptionalMix {
    x1: Int?;
    x2: Bool?;
    x3: String?;
    x4: Cell?;
    x5: Slice?;
    x6: Address?;
    x7: Int?;
    x8: Bool?;
    x9: String?;
    x10: Address?;
}

contract TestContract {
    data: LargeOptionalMix;
    init() {
        self.data = LargeOptionalMix{
            x1: 1,
            x2: false,
            x3: "hi",
            x4: null,
            x5: null,
            x6: null,
            x7: null,
            x8: null,
            x9: null,
            x10: null,
        };
    }
}