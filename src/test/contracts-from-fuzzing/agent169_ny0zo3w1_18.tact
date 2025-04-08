struct OptionalMix {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract TestContract {
    m: OptionalMix;

    init() {
        self.m = OptionalMix{ o1: 1, o2: null, o3: "hi" };
    }
}