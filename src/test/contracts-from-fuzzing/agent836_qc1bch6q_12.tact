struct Level1 {
    val: Int as uint3;
}
struct Level2 {
    l1: Level1;
    n: Int as int8;
}
struct Level3 {
    l2: Level2;
    flag: Bool;
}

contract NestedSerials {
    nested: Level3;
    init() {
        self.nested = Level3{ l2: Level2{ l1: Level1{ val:7 }, n:-5 }, flag:true };
    }
}