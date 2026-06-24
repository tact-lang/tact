struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: String?;
    o5: Int?;
    o6: String?;
    o7: Bool?;
    o8: Int?;
}

contract OptionalsTest {
    v: ManyOptionals;

    init() {
        self.v = ManyOptionals{
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