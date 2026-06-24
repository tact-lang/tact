struct WithString {
    s: String;
}

contract StrTest {
    v: WithString;

    init() {
        self.v = WithString{ s: "hello" };
    }
}
