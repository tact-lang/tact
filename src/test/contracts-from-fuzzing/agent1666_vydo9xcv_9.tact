struct ManyOptionalFields {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Int?;
    o7: Int?;
    o8: Int?;
}

contract ManyOpts {
    storage: ManyOptionalFields;

    init() {
        self.storage = ManyOptionalFields{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
            o6: null,
            o7: null,
            o8: null,
        };
    }
}