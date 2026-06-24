struct Tiny {
    x: Int as uint2;
    y: Int as uint3;
}

struct Mid {
    first: Tiny;
    second: Tiny;
}

struct Outer {
    m: Mid;
    flag: Bool;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            m: Mid{
                first: Tiny{ x: 2, y: 5 },
                second: Tiny{ x: 1, y: 3 },
            },
            flag: true,
        };
    }
}