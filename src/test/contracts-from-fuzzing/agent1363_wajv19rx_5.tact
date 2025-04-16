struct ManyOptionals {
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
}

contract OptionalHolder {
    many: ManyOptionals;

    init() {
        self.many = ManyOptionals{
            o1: null,
            o2: true,
            o3: null,
            o4: 4,
            o5: false,
            o6: "hi",
            o7: 7,
            o8: null,
            o9: "nine",
            o10: null,
            o11: true,
            o12: "hello",
            o13: null,
            o14: false,
            o15: "world",
            o16: 0,
            o17: true,
            o18: null,
            o19: 100,
            o20: null,
        };
    }
}