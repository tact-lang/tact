struct OptStr {
    s: String?;
}

contract Test23 {
    f: OptStr;

    init() {
        self.f = OptStr{ s: null };
    }
}