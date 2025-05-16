struct Outer {
    x: Int;
    y: Bool;
}

contract OptionalMulti {
    one: Outer?;
    two: Outer?;
    three: Outer?;

    init() {
        self.one = null;
        self.two = Outer{ x: 5, y: true };
        self.three = null;
    }
}