struct Level3 { f3: Int; }
struct Level2 { f2: Level3; opt: String?; }
struct Level1 { f1: Level2; flag: Bool; }

contract OptionNested {
    nestedOpt: Level1;

    init() {
        self.nestedOpt = Level1{
            f1: Level2{ f2: Level3{ f3: 7 }, opt: null },
            flag: false
        };
    }
}