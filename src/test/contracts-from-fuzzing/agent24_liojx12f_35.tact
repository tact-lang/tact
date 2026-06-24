// Deeply nested combination with optional and non-optional
struct LevelOne {
    a: Int;
    next: LevelTwo?;
}

struct LevelTwo {
    b: Bool;
    next: LevelThree?;
}

struct LevelThree {
    c: String;
    next: LevelFour?;
}

struct LevelFour {
    d: Bool?;
}

contract Test {
    lv1: LevelOne = LevelOne{
        a: 10,
        next: LevelTwo{
            b: true,
            next: LevelThree{
                c: "hi",
                next: null
            }
        }
    };

    init() {}
}