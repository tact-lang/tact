struct Level3 {
    z: Int;
}

struct Level2 {
    y: Bool;
    nested3: Level3;
}

struct Level1 {
    x: String;
    nested2: Level2;
}

contract DeepChain {
    chain: Level1 = Level1{
        x: "",
        nested2: Level2{ y: false, nested3: Level3{ z: 0 } }
    };

    init() {
        self.chain = Level1 {
            x: "deep",
            nested2: Level2 { y: true, nested3: Level3 { z: 777 } }
        };
    }
}
