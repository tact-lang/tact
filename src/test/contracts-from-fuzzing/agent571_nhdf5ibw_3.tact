struct Level2 {
    data: Int;
}

struct Level1 {
    lvl2: Level2;
}

contract TestContract {
    nestedDeep: Level1;

    init() {
        self.nestedDeep = Level1{lvl2: Level2{data: 123}};
    }
}