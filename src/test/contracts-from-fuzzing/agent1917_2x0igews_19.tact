struct Tiny {
    a: Int;
    b: Int;
}

struct Mid {
    m1: Tiny;
    m2: Tiny;
}

struct Top {
    t: Mid;
    val: String;
}

contract DeepStack {
    data: Top;

    init() {
        self.data = Top{
            t: Mid{
                m1: Tiny{a:1,b:2},
                m2: Tiny{a:3,b:4},
            },
            val: "ok",
        };
    }
}
