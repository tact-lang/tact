struct DeepOpt {
    a: Int?;
    b: Inner?;
}

struct Inner {
    c: Bool?;
}

contract DeepOptionalFields {
    x: DeepOpt;

    init() {
        self.x = DeepOpt{
            a: null,
            b: Inner{ c: null }
        };
    }
}