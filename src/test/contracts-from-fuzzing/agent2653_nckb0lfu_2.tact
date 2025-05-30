struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    point: Inner;
    init() {
        self.point = Inner{
            x: 10,
            y: false,
            z: "abc",
        };
    }
}