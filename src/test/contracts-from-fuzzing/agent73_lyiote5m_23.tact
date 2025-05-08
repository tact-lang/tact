struct DeepOpt {
    x: Int?;
    y: Int?;
    z: Int?;
}

struct Wrapper {
    inner: DeepOpt?;
}

contract Test {
    data: Wrapper;

    init() {
        self.data = Wrapper{ inner: null };
    }
}