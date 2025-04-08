struct MidStruct {
    x: Int;
    y: Bool?;
    z: String;
}

struct TopStruct {
    alpha: Int;
    beta: MidStruct?;
    gamma: String;
}

contract NestedOptionalStruct {
    field: TopStruct;

    init() {
        self.field = TopStruct{
            alpha: 123,
            beta: null,
            gamma: "test"
        };
    }
}