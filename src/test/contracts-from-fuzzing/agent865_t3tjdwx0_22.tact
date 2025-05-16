// Contract with fields of primitive types with varied serialization annotations
contract SerAnnotations {
    val1: Int as int64;
    val2: Int as uint16;
    val3: Int as int8;
    flag: Bool;

    init() {
        self.val1 = 1000000;
        self.val2 = 65000;
        self.val3 = -50;
        self.flag = true;
    }
}
