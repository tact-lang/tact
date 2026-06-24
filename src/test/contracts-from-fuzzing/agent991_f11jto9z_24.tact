struct Sub {
    txt: String?;
    num: Int?;
}

contract OptionalLayer {
    s: Sub?;

    init() {
        self.s = null;
    }
}