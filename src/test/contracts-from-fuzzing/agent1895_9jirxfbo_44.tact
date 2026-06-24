struct TextWrap {
    t: String?;
}

contract StrOptAssign {
    val: TextWrap;
    init() {
        self.val = TextWrap{ t: null };
    }
}