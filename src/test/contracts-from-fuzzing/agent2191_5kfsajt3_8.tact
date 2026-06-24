struct Trio {
    x: Int;
    y: String;
    z: Bool;
}

contract Wide {
    v1: Trio;
    v2: Trio;
    v3: Trio;
    v4: Trio;
    v5: Trio;
    v6: Trio;

    init() {
        self.v1 = Trio{x:1,y:"a",z:true};
        self.v2 = Trio{x:2,y:"b",z:false};
        self.v3 = Trio{x:3,y:"c",z:true};
        self.v4 = Trio{x:4,y:"d",z:false};
        self.v5 = Trio{x:5,y:"e",z:true};
        self.v6 = Trio{x:6,y:"f",z:false};
    }
}
