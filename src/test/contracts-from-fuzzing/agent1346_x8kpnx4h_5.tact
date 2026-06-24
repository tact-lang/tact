struct Sub {
    num: Int;
    txt: String;
}

contract StructWithOptionalNested {
    maybeSub: Sub?;
    answer: Int;

    init() {
        self.maybeSub = null;
        self.answer = 42;
    }
}