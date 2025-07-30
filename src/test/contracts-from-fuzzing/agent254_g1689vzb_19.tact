struct IntOption {
    x: Int?;
    y: Int;
}

contract IntOptionalContract {
    val: IntOption;

    init() {
        self.val = IntOption{ x: null, y: 123 };
    }
}