// nested with serialization formats
struct SerialInner {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

struct SerialOuter {
    s1: SerialInner;
    s2: SerialInner;
}

contract SerialTest {
    data: SerialOuter;
    init() {
        self.data = SerialOuter{
            s1: SerialInner{a:1,b:-100,c:123456},
            s2: SerialInner{a:2,b:200,c:654321},
        };
    }
}
