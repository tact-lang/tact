struct L {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

struct R {
    x: Bool;
    y: String;
    z: Int?;
}

contract SideBySide {
    left: L;
    right: R;

    init() {
        self.left = L{a:1,b:true,c:"a",d:null};
        self.right=R{x:false,y:"b",z:null};
    }
}