// Test many optionals in nested structs
struct Level1 {
    opt1: Int?;
    opt2: String?;
}

struct Level2 {
    l1: Level1?;
    opt3: Bool?;
}

struct Level3 {
    l2: Level2?;
    opt4: Int?;
}

contract Test {
    l3: Level3 = Level3{
        l2: null,
        opt4: null,
    };

    init() {}
}