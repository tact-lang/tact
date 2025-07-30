struct X {
    x: Int;
    y: String;
    z: Bool;
}

contract TestContract {
    f: X?;

    init() {
        self.f = X{
            x: 1,
            y: "hi",
            z: false
        };
    }
}