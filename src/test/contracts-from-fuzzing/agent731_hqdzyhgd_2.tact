struct Level2 {
    z: String = "Hello";
    k: Int?;
}

struct Nested {
    x: Int = 17;
    y: Level2;
}

contract Test {
    foo: Nested = Nested{ y: Level2{} };

    init() {}
}