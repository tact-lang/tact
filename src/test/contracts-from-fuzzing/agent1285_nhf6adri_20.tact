struct Out {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    f1: Out;
    f2: Out;
    f3: Out;
    init() {
        self.f1 = Out{x:1,y:true,z:"a"};
        self.f2 = Out{x:2,y:false,z:"b"};
        self.f3 = Out{x:3,y:true,z:"c"};
    }
}