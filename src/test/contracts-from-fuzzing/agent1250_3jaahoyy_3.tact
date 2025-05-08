struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
    b: Bool;
}

struct Level1 {
    x: Level2;
    s: String;
}

contract TestContract {
    nested: Level1 = Level1{
        x: Level2{
            y: Level3{z:1},
            b: false
        },
        s: "hi"
    };
}