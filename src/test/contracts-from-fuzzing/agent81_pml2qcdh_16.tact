struct ManyOptions {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
}

contract Test {
    f: ManyOptions;

    init() {
        self.f = ManyOptions{
            o1: null,
            o2: null,
            o3: null,
            o4: null
        };
    }
}
