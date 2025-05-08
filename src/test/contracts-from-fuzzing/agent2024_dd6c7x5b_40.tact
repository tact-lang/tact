struct Base {
    x: Int;
}

struct Mid {
    a: Base;
    b: Base?;
}

contract MixedOptNest {
    data: Mid;

    init() {
        self.data = Mid{
            a: Base{x:1},
            b: null
        };
    }
}