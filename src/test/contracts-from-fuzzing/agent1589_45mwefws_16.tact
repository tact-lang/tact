struct HasDefault {
    num: Int = 5;
    flag: Bool = true;
}

contract DefaultStructField {
    val: HasDefault;

    init() {
        self.val = HasDefault{};
    }
}