struct Inner {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    data: Inner;
    init() {
        self.data = Inner{
            x: null,
            y: true,
        };
    }
}