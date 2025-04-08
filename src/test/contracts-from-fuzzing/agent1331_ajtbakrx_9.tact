struct Level2 {
    a: Int?;
    b: Bool?;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract ManyNestedOptionals {
    nested: Level1 = Level1{
        l2a: Level2{a: null, b: null},
        l2b: Level2{a: 1, b: true}
    };
}