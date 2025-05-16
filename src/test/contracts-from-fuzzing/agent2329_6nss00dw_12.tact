struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract LotsOfOptionals {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1: null,
            o2: null,
            o3: null
        };
    }
}
