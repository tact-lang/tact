struct Level2 {
    optInt: Int?;
    optBool: Bool?;
}

struct Level1 {
    l2: Level2?;
}

contract OptionalNestedContract {
    nestedOpt: Level1 = Level1{
        l2: null,
    };

    receive() {}
}