struct IntBoolString {
    n: Int;
    b: Bool;
    s: String;
}

contract TestContract {
    state: IntBoolString;

    init() {
        self.state = IntBoolString{
            n: 42,
            b: true,
            s: "abc"
        };
    }
}