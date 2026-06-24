struct OptString {
    s: String?;
}

contract TestOptString {
    v: OptString;

    init() {
        self.v = OptString{ s: null };
    }
}
