struct Inner {
    p: Int?;
    q: Bool?;
}

contract OptionalStructFields {
    data: Inner;
    init() {
        self.data = Inner{
            p: null,
            q: null
        };
    }
}