struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: String?;
    o5: Bool?;
    o6: String?;
}

contract MultiOptionals {
    optStruct: ManyOptionals;

    init() {
        self.optStruct = ManyOptionals{
            o1: null,
            o2: 2,
            o3: true,
            o4: null,
            o5: false,
            o6: "xyz",
        };
    }
}