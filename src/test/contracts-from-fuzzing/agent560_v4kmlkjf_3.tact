struct Inner {
    x: Int;
    y: Bool;
    z: Address?;
}

contract Test {
    s: Inner;

    init() {
        self.s = Inner{
            x: 5,
            y: false,
            z: null,
        };
    }
}