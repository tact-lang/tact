struct ManyOptionalBools {
    o1: Bool?; o2: Bool?; o3: Bool?; o4: Bool?; o5: Bool?;
    o6: Bool?; o7: Bool?; o8: Bool?; o9: Bool?; o10: Bool?;
    o11: Bool?; o12: Bool?; o13: Bool?; o14: Bool?; o15: Bool?;
    o16: Bool?; o17: Bool?; o18: Bool?; o19: Bool?; o20: Bool?;
}
contract OptionalBoolsTest {
    val: ManyOptionalBools;
    init() {
        self.val = ManyOptionalBools{
            o1:null,o2:null,o3:null,o4:null,o5:null,
            o6:null,o7:null,o8:null,o9:null,o10:null,
            o11:null,o12:null,o13:null,o14:null,o15:null,
            o16:null,o17:null,o18:null,o19:null,o20:null
        };
    }
}