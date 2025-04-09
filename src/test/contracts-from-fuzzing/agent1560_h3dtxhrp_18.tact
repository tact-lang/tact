struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: Bool?;
    o6: String?;
    o7: Int?;
}

contract TestContract {
    optStruct: ManyOptionals = ManyOptionals{
        o1: null,
        o2: null,
        o3: null,
        o4: null,
        o5: null,
        o6: null,
        o7: null
    };
}