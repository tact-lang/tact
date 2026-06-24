struct OptionalInner {
    comment: String?;
}

contract TestContract {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            comment: null
        };
    }
}