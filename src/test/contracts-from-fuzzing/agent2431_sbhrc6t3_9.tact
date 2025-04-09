struct DeepInner {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

struct OuterWithOpt {
    inner: DeepInner?;
}

contract OptInsideOpt {
    data: OuterWithOpt;

    init() {
        self.data = OuterWithOpt{
            inner: null
        };
    }
}