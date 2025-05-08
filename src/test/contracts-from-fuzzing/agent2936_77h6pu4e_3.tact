struct Inner {
    x: Int;
    y: Bool?;
}
contract Test {
    p: Inner;

    init() {
        self.p = Inner{
            x: 5,
            y: null
        };
    }
}