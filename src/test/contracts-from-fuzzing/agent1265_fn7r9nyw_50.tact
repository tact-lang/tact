struct Triple {
    x: Int; y: Int; z: Int;
}

contract RepeatStructs {
    a: Triple;
    b: Triple;
    c: Triple;
    
    init() {
        self.a = Triple{x:1,y:2,z:3};
        self.b = Triple{x:4,y:5,z:6};
        self.c = Triple{x:7,y:8,z:9};
    }
}