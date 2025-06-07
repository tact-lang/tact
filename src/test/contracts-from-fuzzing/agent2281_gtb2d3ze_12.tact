struct NestedSerializations {
    a: Int as uint8;
    b: Int as int32;
    c: Int;
}

contract StructWithSerialized {
    val: NestedSerializations;
    
    init() {
        self.val = NestedSerializations { a:1, b:2, c:3 };
    }
}