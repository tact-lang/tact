struct S1 {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct S2 {
    a: S1?;
    b: S1?;
}

contract OptionalNest {
    data: S2;
    init() {
        self.data = S2{
            a: S1{ x:null, y:null, z:null },
            b: null
        };
    }
    receive() {
        if (self.data.a != null) {
            let _ = self.data.a!!.x;
        }
    }
}