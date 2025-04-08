struct Inner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            x: null,
            y: true,
            z: null,
        };
    }
}