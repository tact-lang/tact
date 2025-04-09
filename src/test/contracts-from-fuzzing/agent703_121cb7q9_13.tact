struct Inner {
    text: String?;
}

contract TestContract {
    data: Inner;
    init() {
        self.data = Inner{
            text: null
        };
    }
}