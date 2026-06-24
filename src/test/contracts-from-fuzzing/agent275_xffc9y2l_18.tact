struct DoubleOptional {
    flag: Bool?;
    note: String?;
}

contract OptionalStructsContract {
    data: DoubleOptional?;

    init() {
        self.data = null;
    }
}