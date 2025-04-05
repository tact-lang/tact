struct Level3 {
    Value: Int;
}

struct Level2 {
    L3: Level3;
}

struct Level1 {
    L2: Level2;
}

contract DeepStructTest {
    receive() {
        // Deeply nested struct initialization
        let s: Level1 = Level1{ L2: Level2{ L3: Level3{ Value: 42 } } };
        // Access nested value
        let x: Int = s.L2.L3.Value;
    }
}
