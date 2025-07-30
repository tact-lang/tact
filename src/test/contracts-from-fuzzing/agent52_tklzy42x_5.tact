struct ManyOptionalFields {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Slice?;
    o6: Builder?;
    o7: Address?;
}

contract ManyOpts {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{
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