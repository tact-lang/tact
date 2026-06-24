struct EmptyStructField {
    val: Int;
}

contract DefaultsTest {
    s: EmptyStructField;

    init() {
        self.s = EmptyStructField{
            val: 0,
        };
    }
}