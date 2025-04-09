struct Inner {
    val: Int;
}

struct Middle {
    maybeInner: Inner?;
}

struct Outer {
    maybeMiddle: Middle?;
}

contract TestContract {
    nestedOptional: Outer;

    init() {
        self.nestedOptional = Outer{ maybeMiddle: null };
    }

    receive() {
        self.nestedOptional = Outer{
            maybeMiddle: Middle{ maybeInner: Inner{ val: 42 } }
        };
    }
}