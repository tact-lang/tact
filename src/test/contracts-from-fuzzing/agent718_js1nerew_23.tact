struct HasBool {
    flag: Bool;
    value: Int;
}

contract BoolInStructTest {
    data: HasBool;

    init() {
        self.data = HasBool{
            flag: true,
            value: 123
        };
    }
}