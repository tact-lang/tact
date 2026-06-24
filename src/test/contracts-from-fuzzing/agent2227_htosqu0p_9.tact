struct Inner {
    x: Int;
}

struct Mid {
    inside: Inner?;
}

struct Outer {
    middle: Mid?;
}

contract NestedOptionals {
    state: Outer;

    init() {
        self.state = Outer{
            middle: Mid{
                inside: Inner{ x: 42 }
            }
        };
    }
}