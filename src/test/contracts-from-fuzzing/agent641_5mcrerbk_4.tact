struct ManyOptions {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract TestContract {
    data: ManyOptions;

    init() {
        self.data = ManyOptions{
            o1: null,
            o2: true,
            o3: "abc"
        };
    }
}