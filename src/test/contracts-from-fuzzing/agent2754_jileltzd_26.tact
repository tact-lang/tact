struct Trio {
    x: Int;
    y: Bool;
    z: String;
}

contract ArrayLike {
    t1: Trio;
    t2: Trio;
    t3: Trio;
    t4: Trio;

    init() {
        self.t1 = Trio{ x:1, y:true, z:"1"};
        self.t2 = Trio{ x:2, y:false, z:"2"};
        self.t3 = Trio{ x:3, y:true, z:"3"};
        self.t4 = Trio{ x:4, y:false, z:"4"};
    }
}
