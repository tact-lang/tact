struct OptionalInner {
    val: Int?;
}

struct OptionalMiddle {
    inner1: OptionalInner?;
    inner2: OptionalInner?;
}

struct OptionalOuter {
    middle: OptionalMiddle?;
    x: Int?;
}

contract DeepManyOptionals {
    z: OptionalOuter;

    init() {
        self.z = OptionalOuter{
            middle: OptionalMiddle{inner1: null, inner2: null},
            x: null
        };
    }
}