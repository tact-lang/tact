struct NestedSerialInner {
    a: Int as uint8;
    b: Int as uint8;
}

struct NestedSerialOuter {
    s: NestedSerialInner;
    c: Int as uint16;
}

contract NestedSerialTest {
    data: NestedSerialOuter;

    init() {
        self.data = NestedSerialOuter{s:NestedSerialInner{a:1,b:2},c:300};
    }
}