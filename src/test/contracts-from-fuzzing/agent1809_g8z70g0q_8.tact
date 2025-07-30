struct ManyOptions {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: String?;
    o5: Slice?;
    o6: Cell?;
    o7: Builder?;
}

contract OptionalFieldsMulti {
    m: ManyOptions;

    init() {
        self.m = ManyOptions{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
            o6: null,
            o7: null
        };
    }
}