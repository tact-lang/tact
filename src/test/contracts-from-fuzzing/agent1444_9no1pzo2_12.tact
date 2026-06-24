struct InnerOpt {
    val: Int?;
}

struct MiddleOpt {
    inner: InnerOpt?;
}

contract OptionalDeep {
    state: MiddleOpt;

    init() {
        self.state = MiddleOpt{ inner: null };
    }
}
