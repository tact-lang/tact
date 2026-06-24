struct MultiLevel {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    x: Int = 7;
    y: Bool = true;
    z: String = "z";
}

contract TestContract {
    m: MultiLevel = MultiLevel{ a: Level1{ b: Level2{ c: Level3{} } } };
    init() {}
    receive() {}
}