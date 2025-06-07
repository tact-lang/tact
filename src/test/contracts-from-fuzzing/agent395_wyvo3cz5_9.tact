struct OptString {
    s: String?;
}

contract NullString {
    data: OptString;
    init() {
        self.data = OptString{
            s: null
        };
    }
}
