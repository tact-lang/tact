struct S {
    x: Int;
    y: Int?;
    z: String;
}

contract C {
    s: S;

    init() {
        self.s = S{
            x: 1,
            y: null,
            z: "test"
        };
    }
}