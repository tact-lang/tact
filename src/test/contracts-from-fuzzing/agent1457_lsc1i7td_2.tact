struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract TestNested {
    data: Inner;

    init() {
        self.data = Inner{
            x: 123,
            y: true,
            z: "nested",
        };
    }
}
