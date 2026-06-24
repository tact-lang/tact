struct OptionInt {
    num: Int?;
}

contract StateWithOptionInt {
    data: OptionInt;
    init() {
        self.data = OptionInt{ num: null };
    }
}