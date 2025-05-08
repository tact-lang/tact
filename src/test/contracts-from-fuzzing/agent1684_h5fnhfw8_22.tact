struct Deep {
    x: Int?;
    y: Int;
}

struct Mid {
    foo: Int;
    bar: Deep;
}

struct High {
    val: Int;
    payload: Mid;
}

contract MixedOrdering {
    s: High;

    init() {
        self.s = High{
            val: 1,
            payload: Mid{
                foo: 2,
                bar: Deep{ x: null, y: 3 }
            }
        };
    }
}