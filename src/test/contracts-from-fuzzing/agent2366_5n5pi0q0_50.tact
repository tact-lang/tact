struct Level2 {
    a: Int;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract TwoDeepStructs {
    l1a: Level1;
    l1b: Level1;

    init() {
        self.l1a = Level1{l2a:Level2{a:1}, l2b:Level2{a:2}};
        self.l1b = Level1{l2a:Level2{a:3}, l2b:Level2{a:4}};
    }
}