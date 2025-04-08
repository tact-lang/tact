struct Level3 { val: String; }

struct Level2 { l3: Level3; opt: Int?; }

struct Level1 { l2: Level2; flag: Bool; }

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{ l3: Level3{ val: "deep" }, opt: null },
            flag: false
        };
    }
}
