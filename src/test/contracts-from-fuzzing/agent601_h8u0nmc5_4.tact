struct ManyOptional {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    o5: String?;
}

contract BigOptional {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
        };
    }
}
