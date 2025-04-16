struct Ints {
    a: Int;
    b: Int as uint4;
    c: Int as int16;
    d: Int as uint64;
}

struct Composed {
    part: Ints;
    val: Int;
}

contract StructCompose {
    c: Composed;
    init() {
        self.c = Composed{
            part: Ints{
                a:1,
                b:2,
                c:3,
                d:4,
            },
            val:42,
        };
    }
}
