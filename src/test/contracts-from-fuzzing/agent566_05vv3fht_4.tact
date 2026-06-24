struct DeepOpt {
    a: Int?;
    b: String?;
    c: Bool?;
    d: InnerOpt?;
}

struct InnerOpt {
    x: Cell?;
    y: Slice?;
    z: Address?;
}

contract OptNest {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
