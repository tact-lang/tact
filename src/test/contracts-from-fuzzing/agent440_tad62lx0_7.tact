struct OptionalInner {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    data: OptionalInner;
    init() {
        self.data = OptionalInner{
            a: null,
            b: null
        };
    }
}