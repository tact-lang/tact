struct OptionalInner {
    val: Int;
}

struct OptionalContainer {
    val1: OptionalInner?;
    val2: OptionalInner?;
    val3: OptionalInner?;
}

contract ManyOptionals {
    state: OptionalContainer;

    init() {
        self.state = OptionalContainer{
            val1: OptionalInner{ val: 1 },
            val2: null,
            val3: OptionalInner{ val: 3 },
        };
    }
}
