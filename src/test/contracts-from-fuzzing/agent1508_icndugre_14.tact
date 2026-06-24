struct S {
    x: Int;
    y: String;
    o: Bool?;
}

contract OptionalAssignment {
    s: S;

    init() {
        self.s = S{
            x: 100,
            y: "abc",
            o: null
        };
    }
}
