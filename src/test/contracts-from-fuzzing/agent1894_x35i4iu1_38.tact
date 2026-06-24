struct Inner {
    xx: Int;
}

contract OptionalStructField {
    inn: Inner?;
    init() {
        self.inn = Inner{ xx:5 };
    }
}