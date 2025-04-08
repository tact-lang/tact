struct Level3 {
    leaf1: Int;
    leaf2: Bool?;
}

struct Level2 {
    branchVal: Int;
    next: Level3;
}

struct Level1 {
    rootVal: Bool;
    next: Level2;
}

contract TestContract {
    data: Level1;
    init() {
        self.data = Level1{
            rootVal: true,
            next: Level2{
                branchVal: 10,
                next: Level3{ leaf1: 99, leaf2: null }
            }
        };
    }
}