// deeply nested optional struct, constructed as null (should default to null)
struct Level3 {
    z: Int?;
}
struct Level2 {
    y: Level3?;
}
struct Level1 {
    x: Level2?;
}

contract DeepNulls {
    data: Level1?;

    init() {
        self.data = null;
    }
}