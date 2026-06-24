struct SOne {
    x: Int;
    y: Int;
}

struct STwo {
    sone1: SOne;
    sone2: SOne;
}

struct SThree {
    s: STwo;
    msg: String;
}

contract MixNested {
    s: SThree = SThree {
        s: STwo {
            sone1: SOne { x: 1, y: 2 },
            sone2: SOne { x: 3, y: 4 },
        },
        msg: "hello",
    };

    init() {}
}