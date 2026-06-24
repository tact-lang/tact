struct BoolInt {
    flag: Bool;
    num: Int;
}

contract BoolIntFields {
    data: BoolInt;

    init() {
        self.data = BoolInt{
            flag: true,
            num: 42
        };
    }
}