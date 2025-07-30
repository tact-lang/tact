// deeply nested struct with serialization on innermost fields
struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    a: Int as uint8;
    b: Bool;
    s: String;
    addr: Address;
}

contract DeepSerialContract {
    storage: Level1;

    init() {
        self.storage = Level1{
            level2: Level2{
                level3: Level3{
                    a: 255,
                    b: true,
                    s: "deep",
                    addr: myAddress(),
                }
            }
        };
    }
}