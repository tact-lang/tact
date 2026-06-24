struct BigNested {
    a: Level1;
    b: Level1;
    c: Level1;
    d: Level1;
    e: Level1;
}

struct Level1 {
    nested: Level2;
}

struct Level2 {
    x: Int;
    y: Bool;
    z: String?;
}

contract TestContract {
    big: BigNested;

    init() {
        self.big = BigNested{
            a: Level1{ nested: Level2{ x:1,y:true,z:null } },
            b: Level1{ nested: Level2{ x:2,y:false,z:null } },
            c: Level1{ nested: Level2{ x:3,y:true,z:null } },
            d: Level1{ nested: Level2{ x:4,y:false,z:null } },
            e: Level1{ nested: Level2{ x:5,y:true,z:null } }
        };
    }
}
