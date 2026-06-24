struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract OptionalFields {
    many: ManyOptionals;

    init() {
        self.many = ManyOptionals{
            o1: null,
            o2: true,
            o3: null
        };
    }
}
