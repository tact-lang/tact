struct WithString {
    a: String;
    b: String;
    c: String;
}

contract ContractString {
    s: WithString;

    init() {
        self.s = WithString{
            a: "a",
            b: "b",
            c: "c"
        };
    }
}