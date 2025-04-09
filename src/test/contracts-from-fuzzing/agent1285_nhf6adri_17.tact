struct Tiny {
    x: Int as uint4;
    y: Int as int8;
    z: Bool;
}

contract TestContract {
    t1: Tiny;
    t2: Tiny;
    init() {
        self.t1 = Tiny{x:5, y:-5, z:true};
        self.t2 = Tiny{x:15, y:7, z:false};
    }
}