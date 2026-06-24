struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract Test2 {
    data: Inner;

    init() {
        self.data = Inner{
            x: 123,
            y: true,
            z: "abc"
        };
    }
}