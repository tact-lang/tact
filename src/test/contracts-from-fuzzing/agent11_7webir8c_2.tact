struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract Test {
    param: Inner;

    init() {
        self.param = Inner{
            x: 5,
            y: false,
            z: "hello",
        };
    }
}
