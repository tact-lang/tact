struct CustomSerialization {
    a: Int as uint8;
    b: Bool;
    c: String;
}

contract CustomSer {
    val: CustomSerialization;
    init() {
        self.val = CustomSerialization{
            a: 123,
            b: true,
            c: "yo"
        };
    }
}