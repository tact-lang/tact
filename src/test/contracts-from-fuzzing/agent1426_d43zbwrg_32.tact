struct OptString {
    s: String?;
}

contract OptStringField {
    data: OptString;

    init() {
        self.data = OptString{ s: null };
    }
}