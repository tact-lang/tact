struct BoolOpt {
    flag: Bool?;
}

contract BoolOptional {
    val: BoolOpt;
    init() {
        self.val = BoolOpt{ flag: null };
    }
}