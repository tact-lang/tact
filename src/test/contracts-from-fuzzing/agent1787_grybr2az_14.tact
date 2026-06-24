struct DeepNestingLevel4 {
    a: Level3;
}

struct Level3 {
    b: Level2;
}

struct Level2 {
    c: Level1;
}

struct Level1 {
    d: Int;
}

contract DeepNest4Test {
    val: DeepNestingLevel4;

    init() {
        self.val = DeepNestingLevel4{
            a: Level3{b: Level2{c: Level1{d: 123}}}
        };
    }
}