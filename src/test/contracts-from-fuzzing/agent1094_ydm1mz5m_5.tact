struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct OptionalOuter {
    f1: Int;
    inner: DeepOptional?;
}

contract OptContract {
    data: OptionalOuter;
    init() {
        self.data = OptionalOuter{
            f1: 100,
            inner: null
        };
    }
}