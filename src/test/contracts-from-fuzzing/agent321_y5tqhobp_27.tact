struct DeepEdge {
    a: Int = 1;
    b: Bool = false;
    c: String = "xxx";
}

struct Wrapper {
    inner: DeepEdge = DeepEdge{};
}

contract EdgeDefaultsWrapper {
    data: Wrapper = Wrapper{};
    init() {}
}