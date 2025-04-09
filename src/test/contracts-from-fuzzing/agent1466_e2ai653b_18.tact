struct Single {
    val: Int;
}

contract SingleField {
    s: Single = Single{ val: 42 };

    init() {
        self.s = Single{ val: 43 };
    }
}
