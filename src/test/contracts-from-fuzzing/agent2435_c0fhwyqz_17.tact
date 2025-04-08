struct LargeNested {
    a: Small;
    b: Small;
    c: Small;
}

struct Small {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a: Small{x:1,y:true,z:"a"},
            b: Small{x:2,y:false,z:"b"},
            c: Small{x:3,y:true,z:"c"},
        };
    }
}