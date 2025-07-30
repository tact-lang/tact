struct Rec {
    x: Int; y: Int; z: Int;
}

struct Container {
    a: Rec;
    b: Rec;
    c: Rec;
}

contract RepeatSameStruct {
    val: Container;
    init() {
        self.val = Container{
            a: Rec{x:1,y:2,z:3},
            b: Rec{x:4,y:5,z:6},
            c: Rec{x:7,y:8,z:9},
        };
    }
}