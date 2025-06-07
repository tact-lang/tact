struct Level2 {
    d: Int;
    e: Int?;
}

struct Level1 {
    a: Int;
    b: Level2;
    c: Int;
}

contract DeepNested {
    nested: Level1;
    init() {
        self.nested = Level1{a:1, b:Level2{d:2, e:null}, c:3};
    }
}