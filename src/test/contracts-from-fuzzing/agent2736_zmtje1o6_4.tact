struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Address?;
    o5: String?;
}

contract OptionalStructField {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
        };
    }
}