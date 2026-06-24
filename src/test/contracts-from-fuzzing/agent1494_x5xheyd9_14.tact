struct InnerMost {
    num: Int as uint8;
}

struct Middle {
    im: InnerMost;
}

struct OuterMost {
    mid: Middle;
}

contract SerializationNestedTest {
    thing: OuterMost;

    init() {
        self.thing = OuterMost{
            mid: Middle{
                im: InnerMost{ num: 255 }
            }
        };
    }
}
