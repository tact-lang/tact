struct CustomWidths {
    a: Int as uint1;
    b: Int as int8;
    c: Int as uint64;
    d: Int as int128;
    e: Int as uint256;
}

contract SerializeWidths {
    val: CustomWidths;
    init() {
        self.val = CustomWidths{
            a:1, b:-5, c:100000, d:-1234567890123456789, e:12345678901234567890
        };
    }
}
