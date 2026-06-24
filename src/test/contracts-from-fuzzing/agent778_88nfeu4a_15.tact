contract OptionalSetNonNull {
    val: Int?;
    flag: Bool?;

    init() {
        self.val = 123;
        self.flag = true;
    }
}