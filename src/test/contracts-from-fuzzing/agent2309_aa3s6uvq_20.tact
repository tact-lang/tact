// deeply nested with optional inner
struct Last {
    c: Int;
}

struct Middle {
    b: Last?;
}

struct First {
    a: Middle;
}

contract DeepOptional {
    state: First;

    init() {
        self.state = First{
            a: Middle{
                b: null
            }
        };
    }
}