struct One {
    a: Int;
}

struct Two {
    a: Int;
    b: String;
}

struct Three {
    a: Bool; 
    b: Int?;
    c: String;
}

contract MultiStructs {
    x: One;
    y: Two;
    z: Three;

    init() {
        self.x = One{a:1};
        self.y = Two{a:2, b:"s"};
        self.z = Three{a:true, b:null, c:"c"};
    }
}