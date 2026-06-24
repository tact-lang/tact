struct BigIntField {
    val: Int as int256;
    flag: Bool;
}

contract TestContract {
    data: BigIntField;

    init() {
        self.data = BigIntField{
            val: 123456789,
            flag: true,
        };
    }
}
