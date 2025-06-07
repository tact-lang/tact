struct Deep {
    a: Int;
}

struct Mid {
    a: Deep;
}

struct Top {
    a: Mid;
}

contract TinyDeepNest {
    data: Top;

    init() {
        self.data = Top{
            a: Mid{
                a: Deep{
                    a: 5
                }
            }
        };
    }
}