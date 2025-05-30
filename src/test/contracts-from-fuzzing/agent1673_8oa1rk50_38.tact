struct SerialNestedOpt {
    x: Int as uint8;
    y: Int as uint16;
    z: Int as uint32;
    optInner: InnerOpt?;
}

struct InnerOpt {
    a: Int as uint8;
    b: Int as uint16;
}

contract SerialNestedOptTest {
    val: SerialNestedOpt;

    init() {
        self.val = SerialNestedOpt {
            x:1,
            y:2,
            z:3,
            optInner: null,
        };
    }
}