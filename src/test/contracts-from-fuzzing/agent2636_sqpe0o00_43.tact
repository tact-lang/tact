struct OptStr {
    s: String?;
}

contract UseOptStr {
    f: OptStr;

    init() {
        self.f = OptStr{ s: null };
    }
}