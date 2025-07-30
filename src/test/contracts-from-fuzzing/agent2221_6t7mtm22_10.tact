struct InnerNum {
    n1: Int as uint8;
    n2: Int as int16;
    n3: Int as uint4;
}

struct NestedNums {
    big: Int;
    packed: InnerNum;
}

contract SerialTest {
    store: NestedNums;

    init() {
        self.store = NestedNums{
            big: 999,
            packed: InnerNum{ n1:255, n2:-12345, n3:15 }
        };
    }
}