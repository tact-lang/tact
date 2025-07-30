struct OptStr {
    s: String?;
}

contract OptStrContract {
    data: OptStr;

    init() {
        self.data = OptStr{ s: null };
    }
}