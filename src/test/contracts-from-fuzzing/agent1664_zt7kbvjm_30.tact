struct OptInner {
    small: Int as uint8;
    note: String?;
}

contract OptStructWithHints {
    val: OptInner?;

    init() {
        self.val = OptInner{
            small: 12,
            note: null
        };
    }
}