struct Level3 {
    z: Int = 3;
}

struct Level2 {
    inner3: Level3 = Level3{};
}

struct Level1 {
    inner2: Level2 = Level2{};
}

contract TestContract {
    deepNest: Level1 = Level1{};
    
    init() {}
}
