struct OptComposite {
    a: Int?;
    b: Bool?;
}

contract OptCompositeContract {
    val: OptComposite?;

    init() {
        self.val = null;
    }
}