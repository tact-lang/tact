struct Tiny {
    x: Int;
}

struct Holder {
    inner1: Tiny;
    inner2: Tiny;
    inner3: Tiny;
    inner4: Tiny;
    inner5: Tiny;
}

contract TinyPack {
    val: Holder;

    init() {
        self.val = Holder{
            inner1: Tiny{ x: 1 },
            inner2: Tiny{ x: 2 },
            inner3: Tiny{ x: 3 },
            inner4: Tiny{ x: 4 },
            inner5: Tiny{ x: 5 }
        };
    }
}