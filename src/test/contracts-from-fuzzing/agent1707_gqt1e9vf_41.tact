struct DeepOpt {
    a: Int?;
    b: Bool?;
}

struct Wrapper {
    inner: DeepOpt?;
}

contract DeepOptWrap {
    v: Wrapper;

    init() {
        self.v = Wrapper{ inner: null };
    }
}