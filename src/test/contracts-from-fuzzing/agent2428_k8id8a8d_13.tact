struct Rec {
    x: Int;
    y: Bool;
}

contract TestContract {
    r1: Rec = Rec{ x:1,y:true };
    r2: Rec = Rec{ x:2,y:false };

    init() {
        self.r1 = Rec{ x:5,y:true };
        self.r2 = Rec{ x:6,y:false };
    }
}