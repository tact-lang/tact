struct Rec3 {
    val: Int;
}

struct Rec2 {
    rec3: Rec3;
}

struct Rec1 {
    rec2: Rec2;
}

contract RecChain {
    payload: Rec1;

    init() {
        self.payload = Rec1{
            rec2: Rec2{
                rec3: Rec3{
                    val: 123
                }
            }
        };
    }
    receive() {
        self.payload.rec2.rec3.val += 1;
    }
}