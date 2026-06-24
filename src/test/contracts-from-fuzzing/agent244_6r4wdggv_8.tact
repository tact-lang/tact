struct ManyOptional {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Bool?;
    o5: Int?;
    o6: Bool?;
}

contract MultiOptionalStorage {
    many: ManyOptional;

    init() {
        self.many = ManyOptional{
            o1: null, o2: null, o3: null, o4: null, o5: null, o6: null
        };
    }
}