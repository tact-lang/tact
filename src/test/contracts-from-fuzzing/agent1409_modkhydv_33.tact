trait TT { 
    x: Int;
    y: Bool;
    z: Int?;
}

contract Inherit with TT {
    x: Int;
    y: Bool;
    z: Int?;
    init() {
        self.x = 1;
        self.y = true;
        self.z = null;
    }
    receive() { let _=self.x; }
}