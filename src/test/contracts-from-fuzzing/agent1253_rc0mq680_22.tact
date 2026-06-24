struct WithString {
    s: String;
    n: Int;
}

contract StrTest {
    val: WithString;

    init() {
        self.val = WithString{s:"hello", n:123};
    }
}
