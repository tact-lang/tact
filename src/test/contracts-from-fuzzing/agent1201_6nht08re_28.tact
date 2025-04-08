// very deeply nested (5 levels) structs in contract parameter
contract DeepParam(
    val: Level1
) {}

struct Level1 {
    next: Level2;
}
struct Level2 {
    next: Level3;
}
struct Level3 {
    next: Level4;
}
struct Level4 {
    next: Level5;
}
struct Level5 {
    x: Int;
    y: Bool;
}
