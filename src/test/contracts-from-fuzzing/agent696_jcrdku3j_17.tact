struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract ManyFields {
    f1: Inner;
    f2: Inner;
    f3: Inner;
    f4: Inner;
    f5: Inner;

    init() {
        self.f1 = Inner{ x:1, y:true, z:"a" };
        self.f2 = Inner{ x:2, y:false, z:"b" };
        self.f3 = Inner{ x:3, y:true, z:"c" };
        self.f4 = Inner{ x:4, y:false, z:"d" };
        self.f5 = Inner{ x:5, y:true, z:"e" };
    }
}