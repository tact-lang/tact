contract BoolAndOptional {
    flag: Bool = true;
    answer: Int?;

    init() {
        self.answer = null;
    }
}