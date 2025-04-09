struct SerializeHints {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
}

contract Narrowing {
    val: SerializeHints;

    init() {
        self.val = SerializeHints{
            a: 5,
            b: -8,
            c: 123456
        };
    }
}