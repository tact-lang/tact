struct WithString {
    s: String;
}

contract Test20 {
    val: WithString;
    init() {
        self.val = WithString{ s: "some very very very long string that should still serialize correctly in storage and tests the edge of string packing behavior" };
    }
}