struct ManyOpts {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Int?;
    o7: Int?;
    o8: Int?;
    o9: Int?;
    o10: Int?;
}

contract ManyOptionalFields {
    opts: ManyOpts;

    init() {
        self.opts = ManyOpts {
            o1: 1, o2: 2, o3: null, o4: 4, o5: null,
            o6: 6, o7: null, o8: 8, o9: 9, o10: null
        };
    }
}