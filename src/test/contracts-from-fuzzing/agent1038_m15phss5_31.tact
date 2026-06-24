struct ManyNullOptionals {
    o1: Int?;
    o2: String?;
    o3: Int?;
    o4: Bool?;
    o5: Address?;
}

contract ManyNullOptInits {
    f: ManyNullOptionals = ManyNullOptionals{
        o1: null,
        o2: null,
        o3: null,
        o4: null,
        o5: null
    };
    init() {}
}