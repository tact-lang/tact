struct Wrap {
    num: Int;
    text: String?;
}

contract WrapNullString {
    w: Wrap;

    init() {
        self.w = Wrap{ num: 56, text: null };
    }
}