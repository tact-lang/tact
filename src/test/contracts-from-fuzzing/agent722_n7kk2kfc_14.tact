struct NestedOpt {
    s: String?;
    b: Bool?;
}

struct TopOpt {
    id: Int;
    nested: NestedOpt?;
}

contract OptionalStructs {
    data: TopOpt;

    init() {
        self.data = TopOpt{
            id: 11,
            nested: null,
        };
    }
}