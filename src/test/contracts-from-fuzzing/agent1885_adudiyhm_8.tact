struct ManyBoolOpt {
    o1: Bool?;
    o2: Bool?;
    o3: Bool?;
    o4: Bool?;
    o5: Bool?;
}

contract ManyOptionalBools {
    s: ManyBoolOpt;

    init() {
        self.s = ManyBoolOpt{
            o1: null,
            o2: true,
            o3: null,
            o4: false,
            o5: null
        };
    }
}