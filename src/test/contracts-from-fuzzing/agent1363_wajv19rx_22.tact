struct OptFlags {
    o1: Bool?;
    o2: Bool?;
    o3: Bool?;
    o4: Bool?;
    o5: Bool?;
    o6: Bool?;
    o7: Bool?;
    o8: Bool?;
    o9: Bool?;
    o10: Bool?;
    o11: Bool?;
    o12: Bool?;
    o13: Bool?;
    o14: Bool?;
    o15: Bool?;
    o16: Bool?;
}

contract BigOptFlags {
    flags: OptFlags;

    init() {
        self.flags = OptFlags{
            o1: true, o2: null, o3: false, o4: null,
            o5: true, o6: null, o7: false, o8: null,
            o9: true, o10: null, o11: false, o12: null,
            o13: true, o14: null, o15: false, o16: null,
        };
    }
}