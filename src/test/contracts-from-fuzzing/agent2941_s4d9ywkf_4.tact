struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: Bool?;
    o6: String?;
}

contract OptionalFields {
    opt: ManyOptionals;

    init() {
        self.opt = ManyOptionals{
            o1: null,
            o2: true,
            o3: "abc",
            o4: 4,
            o5: null,
            o6: null,
        };
    }
}