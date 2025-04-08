struct Rec1 {
    x: Int;
    opt: Rec2?;
}
struct Rec2 {
    y: Int;
    opt: Rec3?;
}
struct Rec3 {
    z: Int;
    opt: Rec4?;
}
struct Rec4 {
    w: Int;
}

contract DeepOptionChain {
    rec: Rec1;

    init() {
        self.rec = Rec1{
            x:5,
            opt: Rec2{
                y:6,
                opt: Rec3{
                    z:7,
                    opt: Rec4{w:8}
                }
            }
        };
    }

    receive() {
        self.rec.x = self.rec.x+1;
    }
}