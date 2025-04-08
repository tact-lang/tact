struct X {
    val: Int;
    text: String?;
}

contract OptionalDefault {
    data: X;
    init() {
        self.data = X{ val: 5, text: null };
    }
}