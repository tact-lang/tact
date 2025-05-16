struct ManyOpts {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: Bool?;
    o6: String?;
    o7: Int?;
    o8: Bool?;
    o9: String?;
    o10: Int?;
    o11: Bool?;
    o12: String?;
    o13: Int?;
    o14: Bool?;
    o15: String?;
    o16: Int?;
    o17: Bool?;
    o18: String?;
    o19: Int?;
    o20: Bool?;
    o21: String?;
    o22: Int?;
    o23: Bool?;
    o24: String?;
    o25: Int?;
}

contract ManyOptionalFields {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            o1: null, o2: true, o3: null, o4: 4, o5: false, o6: "hi",
            o7: null, o8: null, o9: "yo", o10: null, o11: null, o12: null,
            o13: 13, o14: true, o15: null, o16: 16, o17: null, o18: "bye",
            o19: null, o20: false, o21: "zero", o22: 22, o23: true, o24: null,
            o25: 25
        };
    }
}