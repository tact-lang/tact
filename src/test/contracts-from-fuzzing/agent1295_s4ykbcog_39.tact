// nested structs with different non-default serializations
struct InnerMost {
    a: Int as uint8;
    b: Int as int16;
}

struct Middle {
    nest: InnerMost;
    z: Int as uint32;
}

contract SerializeTest {
    data: Middle;

    init() {
        self.data = Middle{
            nest: InnerMost{ a: 1, b: 2 },
            z: 3
        };
    }
}