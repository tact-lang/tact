struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Int?;
    o4: Bool?;
    o5: Int?;
    o6: Bool?;
    o7: Int?;
    o8: Bool?;
    o9: Int?;
    o10: Bool?;
}

contract TestContract {
    many: ManyOptionals;

    init() {
        self.many = ManyOptionals{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
            o6: null,
            o7: null,
            o8: null,
            o9: null,
            o10: null
        };
    }
}