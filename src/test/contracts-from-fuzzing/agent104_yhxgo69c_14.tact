struct HasString {
    s1: String;
    s2: String?;
}

contract TestContract {
    data: HasString;
    init() {
        self.data = HasString{ s1: "foo", s2: null };
    }
}