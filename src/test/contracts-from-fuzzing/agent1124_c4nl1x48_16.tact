struct Level1 { foo: Int; }
struct Level2 { l1: Level1; bar: String; }
struct Level3 { l2: Level2; flag: Bool; }

contract DeepChain {
    d: Level3;
    init() {
        self.d = Level3{
            l2: Level2{ l1: Level1{ foo: 10 }, bar: "bar" },
            flag: true
        };
    }
}