struct Top {
    a: Level1;
    b: Level1;
}

struct Level1 {
    x: Int;
    y: Bool;
    l2: Level2;
}

struct Level2 {
    s: String;
    opt: Int?;
}

contract MultiBranch {
    val: Top;
    init() {
        self.val = Top{
            a: Level1{ x:1,y:true,l2:Level2{ s:"a", opt: null }},
            b: Level1{ x:2,y:false,l2:Level2{ s:"b", opt: 5 }}
        };
    }
}