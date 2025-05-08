struct Reordered {
    a: Int;
    b: Bool;
    c: String;
}

contract FieldReorderTest {
    f: Reordered;
    init() {
        self.f = Reordered{
            c: "text",
            b: true,
            a: 123
        };
    }
}