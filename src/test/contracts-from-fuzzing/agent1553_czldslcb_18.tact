struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: String?;
}

contract NestedOptionals {
    d: DeepOpt;
    init() {
        self.d = DeepOpt{
            a: null,
            b: null,
            c: null
        };
    }
}