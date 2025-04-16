struct NumAndText {
    num: Int?;
    txt: String?;
}

contract NullComposite {
    data: NumAndText;
    init() {
        self.data = NumAndText{ num: null, txt: null };
    }
}