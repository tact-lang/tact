struct ABC {
    a: Int;
    b: String;
    c: Bool;
}

contract Test {
    abc: ABC;

    init() {
        self.abc = ABC{
            a: 1,
            b: "b",
            c: true
        };
    }
}