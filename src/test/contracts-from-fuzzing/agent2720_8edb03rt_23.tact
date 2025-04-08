struct Level3 {
    str: String;
    flag: Bool?;
}

struct Level2 {
    addr: Address?;
    nested: Level3;
}

struct Level1 {
    mid: Level2;
}

contract Test {
    lv1: Level1 = Level1{
        mid: Level2{
            addr: null,
            nested: Level3{ str: "deep", flag: true }
        }
    };
}