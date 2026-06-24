struct S1 {
    x: Int as int64;
    y: Int as uint192;
}

contract SerializeSizeTest {
    val: S1;
    
    init() {
        self.val = S1{ x:-5, y:10000 };
    }
}
