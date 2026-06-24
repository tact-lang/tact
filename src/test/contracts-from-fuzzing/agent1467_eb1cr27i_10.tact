struct ManyOptions {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Cell?;
    o5: Slice?;
}

contract MultiOptContract {
    data: ManyOptions;
    init() {
        self.data = ManyOptions{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null
        };
    }
}