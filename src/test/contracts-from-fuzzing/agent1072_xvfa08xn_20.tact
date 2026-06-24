struct Packed {
    a: Int as uint3;
    b: Int as uint5;
    c: Int as int8;
}

contract SerializationTesting {
    val: Packed;

    init() {
        self.val = Packed{ a:3, b:25, c:-5 };
    }
}