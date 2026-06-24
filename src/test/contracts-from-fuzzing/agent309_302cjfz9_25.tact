struct MultipleOptionFields {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Address?;
}

contract OptionalsMix {
    vals: MultipleOptionFields;

    init() {
        self.vals = MultipleOptionFields{
            o1: null,
            o2: "hi",
            o3: null,
            o4: null
        };
    }
}