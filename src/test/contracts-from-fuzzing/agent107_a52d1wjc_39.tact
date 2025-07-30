struct HasInt {
    foo: Int as uint8;
}

contract SerializeWidth {
    val: HasInt;

    init() {
        self.val = HasInt{ foo: 255 };
    }
}