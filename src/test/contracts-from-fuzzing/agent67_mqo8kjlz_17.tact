struct Rec1 {
    x: Int;
    y: Bool?;
}

struct Rec2 {
    r1: Rec1;
    z: String;
}

contract TestContract {
    rec: Rec2;

    init() {
        self.rec = Rec2{
            r1: Rec1{ x:7, y:false },
            z: "hello"
        };
    }
}