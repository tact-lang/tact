// deeply nested with optional in the middle
struct Third {
    y: Int;
}

struct Second {
    b: Bool;
    t: Third?;
}

struct First {
    a: Int;
    s: Second;
}

contract NestedOptionalMiddle {
    val: First;
    init() {
        self.val = First{
            a: 5,
            s: Second{
                b: false,
                t: null
            }
        };
    }
}