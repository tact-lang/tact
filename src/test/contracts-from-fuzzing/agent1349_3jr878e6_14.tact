struct WithString {
    s: String;
    b: Bool;
}

contract StringState {
    field: WithString = WithString{ s: "test", b: true };

    receive() {
        self.field = self.field;
    }
}