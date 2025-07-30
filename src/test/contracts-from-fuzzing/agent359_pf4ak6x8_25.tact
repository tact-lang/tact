struct Int8Struct {
    a: Int as uint8;
    b: Int as int8;
}

contract Int8Test {
    val: Int8Struct;
    init() {
        self.val = Int8Struct{ a: 5, b: -5 };
    }
}