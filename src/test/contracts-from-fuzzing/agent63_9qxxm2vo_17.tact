struct Something {
    num: Int;
}

contract OptionalStructField {
    val: Something?;

    init() {
        self.val = Something{ num: 17 };
    }
}