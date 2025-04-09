struct HasString {
    s: String;
}

contract OptStructInside {
    f: HasString?;

    init() {
        self.f = null;
    }
}
