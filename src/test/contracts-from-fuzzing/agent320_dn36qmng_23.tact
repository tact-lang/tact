struct WithString {
    a: String;
    b: String;
    c: String;
}

contract Test {
    str: WithString;

    init() {
        self.str = WithString{
            a: "a",
            b: "b",
            c: "c",
        };
    }
}