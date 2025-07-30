struct LevelA { x: Int; }
struct LevelB { y: Bool; child: LevelA; }
struct LevelC { z: String; child: LevelB; opt: Int?; }

contract ChainStorage {
    chain: LevelC;

    init() {
        self.chain = LevelC{
            z: "test",
            child: LevelB{
                y: false,
                child: LevelA{ x: 123 }
            },
            opt: null
        };
    }
}