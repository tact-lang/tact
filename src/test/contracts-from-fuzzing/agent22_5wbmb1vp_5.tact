struct DeepOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
    bar: String?;
    buzz: Bool?;
}

contract TestContract {
    dopt: DeepOpt;

    init() {
        self.dopt = DeepOpt{inner: null};
    }
}