struct SerialNested {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
}

struct SerialContainer {
    nested: SerialNested;
    d: Int as uint32;
}

contract SerialNestedTest {
    s: SerialContainer;
    init() {
        self.s = SerialContainer{
            nested: SerialNested{a:1,b:2,c:3},
            d: 4
        };
    }
    receive() {}
}