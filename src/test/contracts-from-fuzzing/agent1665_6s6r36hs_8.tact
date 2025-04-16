struct Level3 {
    x: Int = 33;
    y: Bool = true;
}

struct Level2 {
    deeper: Level3 = Level3{};
}

struct Level1 {
    deeper: Level2 = Level2{};
    flag: Bool = false;
}

struct Root {
    a: Int = 1;
    b: Level1 = Level1{};
    c: String = "core";
}

contract TestContract {
    r: Root = Root{};

    init() {}
}