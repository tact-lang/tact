struct Bonus {
    x: Int;
    y: String;
}

contract DirectOptInit {
    foo: Bonus?;

    init() {
        self.foo = Bonus{ x: 5, y: "abc" };
    }
}