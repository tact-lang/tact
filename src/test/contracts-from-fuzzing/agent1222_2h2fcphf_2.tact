struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{
            x: 7,
            y: false,
            z: "test"
        };
    }
}