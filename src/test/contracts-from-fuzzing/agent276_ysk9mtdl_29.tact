struct Mid {
    value: Int;
}

contract OptionalStructField {
    mid: Mid?;

    init() {
        self.mid = Mid{value: 42};
    }
}
