struct OptNested {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract OptOptional {
    state: OptNested;
    init() {
        self.state = OptNested{inner: null};
    }
}