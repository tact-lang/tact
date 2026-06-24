struct Wrap {
    a: Int?;
    b: Bool?;
}

contract OptWrap {
    x: Wrap?;
    init() {
        self.x = null;
    }
}