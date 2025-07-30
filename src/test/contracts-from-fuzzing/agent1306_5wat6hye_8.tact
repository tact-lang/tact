struct InnerMost {
    data: String?;
}

struct MidLevel {
    nested: InnerMost;
    flag: Bool;
}

struct HighLevel {
    id: Int;
    payload: MidLevel;
}

contract DeeplyNested {
    data: HighLevel;
    init() {
        self.data = HighLevel{
            id: 9,
            payload: MidLevel{
                nested: InnerMost{ data: null },
                flag: true
            }
        };
    }
}