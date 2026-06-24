struct Test1 { a: Int as uint8; }
struct Test2 { b: Int as int16; }

contract MixedSerialization {
    val1: Test1;
    val2: Test2;
    init() {
        self.val1 = Test1{a: 10};
        self.val2 = Test2{b: -123};
    }
}