// Test serialization annotations with nested structs
struct SubAnnotated {
    x: Int as uint64;
    y: Int as int8;
}

struct TopAnnotated {
    a: SubAnnotated;
    b: Int as coins;
}

contract AnnotatedFieldsTest {
    data: TopAnnotated;

    init() {
        self.data = TopAnnotated{
            a: SubAnnotated{x: 55, y: -7},
            b: 1000,
        };
    }
}
