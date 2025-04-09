struct OptLevels {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract DefaultedOptStruct {
    stuff: OptLevels = OptLevels{
        o1: null,
        o2: null,
        o3: null
    };
}