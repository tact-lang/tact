struct Level3 {
    a: Int; b: Int?;
}

struct Level2 {
    x: Bool;
    y: Level3;
}

struct Level1 {
    s: Level2;
    num: Int;
}

contract ManyNestedOptionals {
    data: Level1;

    init() {
        self.data = Level1{
            s: Level2{
                x:true,
                y:Level3{a:1,b:null}
            },
            num: 10
        };
    }
}