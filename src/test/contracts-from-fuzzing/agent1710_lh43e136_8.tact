struct OptNested {
    inner: String?;
}

contract OptInside {
    val: OptNested;

    init() {
        self.val = OptNested{ inner: null };
    }
}