struct MultiOption {
    ai: Int?;
    ab: Bool?;
    as_: String?;
    aa: Address?;
    asl: Slice?;
    acl: Cell?;
    abu: Builder?;
}

contract OptionalVarietyTest {
    data: MultiOption;

    init() {
        self.data = MultiOption {
            ai: null,
            ab: null,
            as_: null,
            aa: null,
            asl: null,
            acl: null,
            abu: null
        };
    }
}