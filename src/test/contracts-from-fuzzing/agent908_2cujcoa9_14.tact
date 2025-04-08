struct Small {
    a: Int;
}

struct Medium {
    small: Small?;
    b: Bool;
}

contract OptionalInOptional {
    m: Medium?;

    init() {
        self.m = null;
    }
}