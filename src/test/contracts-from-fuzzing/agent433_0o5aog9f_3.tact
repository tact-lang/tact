struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    coords: Inner;

    init() {
        self.coords = Inner{
            x: 7,
            y: true,
            z: "abc",
        };
    }
}