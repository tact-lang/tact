// nested optional of optional struct (single level nested optionals are allowed)

struct OptionalInner {
    z: Int;
}

contract OptionalOuterOpt {
    val: OptionalInner?;

    init() {
        self.val = null;
    }
}