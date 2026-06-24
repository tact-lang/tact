struct DeepOptionals {
    v1: Int?;
    v2: Bool?;
    v3: Address?;
    v4: Cell?;
    v5: Slice?;
    v6: String?;
}

contract Test {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            v1: null,
            v2: null,
            v3: null,
            v4: null,
            v5: null,
            v6: null
        };
    }
}