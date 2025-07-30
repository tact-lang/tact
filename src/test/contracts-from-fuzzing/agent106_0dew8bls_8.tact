struct OptionalInner {
    val: Int?;
}

struct Middle {
    nested: OptionalInner?;
}

contract OptionalDeeplyNested {
    state: Middle;

    init() {
        self.state = Middle{nested: null};
    }

    receive() {
        self.state = Middle{nested: OptionalInner{val: 99}};
    }
}