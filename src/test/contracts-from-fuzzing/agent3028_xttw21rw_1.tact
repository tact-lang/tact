struct Inner {
    a: Int;
    b: Int?;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{
            a: 1,
            b: null,
        };
    }
}
