struct ManyOptionals {
    v1: Int?;
    v2: Bool?;
    v3: String?;
    v4: Address?;
    v5: Cell?;
    v6: Slice?;
    v7: Int?;
    v8: Bool?;
    v9: String?;
}

contract TestContract {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            v1: 1,
            v2: false,
            v3: null,
            v4: null,
            v5: null,
            v6: null,
            v7: null,
            v8: null,
            v9: null
        };
    }
}