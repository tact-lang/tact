struct Level3 {
    val1: Int;
    val2: Bool;
}

struct Level2 {
    a: Level3;
    b: Level3;
    c: Bool;
}

struct Level1 {
    foo: Level2;
    bar: Level2;
    optional: Int?;
    anotherFlag: Bool?;
}

contract TestContract {
    storage: Level1;

    init() {
        self.storage = Level1{
            foo: Level2{
                a: Level3{val1:0,val2:false},
                b: Level3{val1:1,val2:true},
                c: true,
            },
            bar: Level2{
                a: Level3{val1:2,val2:true},
                b: Level3{val1:3,val2:false},
                c: false,
            },
            optional: null,
            anotherFlag: null,
        };
    }
}
