struct Rec {
    a: Int;
    b: Bool;
    c: String?;
}

contract MultiVar {
    x: Rec;
    y: Rec;
    z: Rec;

    init() {
        self.x = Rec{ a:1, b:true, c: null };
        self.y = Rec{ a:2, b:false, c: "y" };
        self.z = Rec{ a:3, b:true, c: "z" };
    }
}
