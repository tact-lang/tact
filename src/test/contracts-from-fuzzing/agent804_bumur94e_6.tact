struct DeepInner {
    z: Int?;
    label: String?;
}

struct DeepOuter {
    y: DeepInner?;
}

contract TestContract {
    data: DeepOuter;

    init() {
        self.data = DeepOuter{
            y: null
        };
    }
}
