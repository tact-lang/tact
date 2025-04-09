struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Wrap {
    inner: DeepOpt?;
}

contract OptionalWrapper {
    state: Wrap;

    init() {
        self.state = Wrap{
            inner: null,
        };
    }
}