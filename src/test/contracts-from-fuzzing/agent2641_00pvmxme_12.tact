struct OptionalNest {
    inner: Int?;
    inner2: String?;
    inner3: Bool?;
}

contract OptNest {
    val: OptionalNest?;

    init() {
        self.val = null;
    }
}