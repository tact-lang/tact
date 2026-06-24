struct OptionalInner {
    s: String?;
    b: Bool?;
}

contract TestContract {
    state: OptionalInner;

    init() {
        self.state = OptionalInner{
            s: null,
            b: null,
        };
    }
}