struct ManyOptionals {
    o1: Int?;
    o2: String?;
    o3: Bool?;
}

contract TestManyOptional {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1: null,
            o2: null,
            o3: null,
        };
    }
}
