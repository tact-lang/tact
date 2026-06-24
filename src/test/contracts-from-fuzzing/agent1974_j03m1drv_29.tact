struct Mid {
    x: Int;
    y: Int?;
    z: Bool;
}

contract SeveralMids {
    m1: Mid;
    m2: Mid;
    m3: Mid;

    init() {
        self.m1 = Mid{ x:1, y:null, z:true };
        self.m2 = Mid{ x:2, y:3, z:false };
        self.m3 = Mid{ x:4, y:null, z:true };
    }
}
