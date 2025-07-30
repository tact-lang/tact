struct Inner {
    x: Int;
    y: Bool?;
    z: String;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{
            x: 1,
            y: null,
            z: "hello",
        };
    }
}
