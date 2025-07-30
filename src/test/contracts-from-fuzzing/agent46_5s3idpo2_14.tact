struct InnerOne { x: Int as uint8 }
struct InnerTwo { y: Int as int16 }

struct Middle {
    a: InnerOne;
    b: InnerTwo;
}

contract MixedSerializationNested {
    m: Middle;

    init() {
        self.m = Middle{
            a: InnerOne{ x: 1 },
            b: InnerTwo{ y: -5 }
        };
    }
}
