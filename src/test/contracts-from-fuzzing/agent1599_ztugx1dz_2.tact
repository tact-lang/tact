struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract TestNested {
    innerField: Inner;

    init() {
        self.innerField = Inner{
            x: 42,
            y: true,
            z: "nested"
        };
    }
}