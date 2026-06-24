struct IntAndBool {
    a: Int;
    b: Bool;
    c: Int?;
}

contract OptionalMix {
    data: IntAndBool;

    init() {
        self.data = IntAndBool{ a: 1, b: false, c: null };
    }
}