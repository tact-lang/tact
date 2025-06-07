struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract Test {
    value: Inner;

    init() {
        self.value = Inner{
            x: 5,
            y: true,
            z: "abc",
        };
    }
}