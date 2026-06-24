// Deeply nested struct without nullables
struct Level3 { x: Int; y: Bool; }
struct Level2 { l3: Level3; flag: Bool; }
struct Level1 { l2: Level2; s: String; }

contract DeepNoNull {
    nested: Level1 = Level1{
        l2: Level2{ l3: Level3{ x: 1, y: false }, flag: true },
        s: "end"
    };

    receive() {}
}