struct S {
    x: Int;
    y: Int?;
    z: Bool;
}

contract OptionalMiddle {
    data: S;

    init() {
        self.data = S {
            x: 10,
            y: null,
            z: false
        };
    }
}