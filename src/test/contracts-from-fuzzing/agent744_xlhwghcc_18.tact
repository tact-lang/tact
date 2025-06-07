struct Rec {
    a:Int;
    b:Rec2;
}

struct Rec2 {
    x:Int;
    y:Rec3;
}

struct Rec3 {
    z:Int;
}

contract TestContract {
    rec: Rec;

    init() {
        self.rec = Rec{
            a:1,
            b: Rec2 {
                x:2,
                y: Rec3{
                    z:3
                }
            }
        };
    }
}