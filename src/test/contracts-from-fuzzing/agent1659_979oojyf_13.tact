struct Tiny {
    i: Int as uint8;
    b: Bool;
}

struct Compact {
    t1: Tiny;
    t2: Tiny;
    t3: Tiny;
    t4: Tiny;
}

contract C {
    storage: Compact;

    init() {
        self.storage = Compact{
            t1:Tiny{i:0,b:true},
            t2:Tiny{i:1,b:false},
            t3:Tiny{i:2,b:true},
            t4:Tiny{i:3,b:false}
        };
    }
}