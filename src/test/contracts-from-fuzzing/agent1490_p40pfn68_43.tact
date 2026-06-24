struct InnerMost {
    val: Int as uint8;
}

struct MiddleOpt {
    nested: InnerMost?;
}

struct Outer {
    midOpt: MiddleOpt?;
    val2: Int as int16;
}

contract OptSerializeMix {
    data: Outer;

    init() {
        self.data = Outer{
            midOpt: null,
            val2: 123
        };
    }
}