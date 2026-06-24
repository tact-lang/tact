struct Inner {
    optionalVal: Int?;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ optionalVal: null };
    }
}