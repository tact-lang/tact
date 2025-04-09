struct DeepOpts {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Wrapper {
    f1: DeepOpts?;
    f2: DeepOpts?;
    f3: DeepOpts?;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            f1: DeepOpts{ a: 1, b: true, c: "x" },
            f2: null,
            f3: DeepOpts{ a: 7, b: null, c: "y" },
        };
    }
}