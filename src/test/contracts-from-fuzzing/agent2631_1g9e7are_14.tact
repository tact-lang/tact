struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptOpt {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{inner: null};
    }
}