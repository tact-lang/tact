struct Level2 {
    x: Int;
    y: Bool;
}

struct Level1 {
    nested: Level2;
    s: String;
}

contract NestedInFields {
    f1: Level1;
    f2: Level2;

    init() {
        self.f1 = Level1{nested: Level2{x:1,y:true}, s:"ok"};
        self.f2 = Level2{x:2,y:false};
    }
}