struct Rec1 {
    b: Bool;
}

struct Rec2 {
    r1: Rec1;
    txt: String;
}

contract TestContract {
    f1: Rec1;
    f2: Rec2;

    init() {
        self.f1 = Rec1{b:false};
        self.f2 = Rec2{r1:Rec1{b:true}, txt:"hey"};
    }
}