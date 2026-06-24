struct BooleanWrap {
    flag: Bool;
}

contract StoreBoolWrap {
    b: BooleanWrap;

    init() {
        self.b = BooleanWrap { flag: true };
    }
}