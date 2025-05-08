struct Level3 { value: Int; }
struct Level2 { nested: Level3?; }
struct Level1 { nested: Level2?; }

contract TestDeepOptional {
    receive() {
        let data: Level1 = Level1 { nested: Level2 { nested: Level3 { value: 123 } } };
        return;
    }
}
