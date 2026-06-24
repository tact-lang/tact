struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    data: Inner;
    init() {
        self.data = Inner{
            x: 10,
            y: false,
            z: "nested"
        };
    }
}