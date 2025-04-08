struct Rec {
    rec1: Int;
    rec2: Int;
    rec3: Int;
    rec4: Int;
    rec5: Int;
    rec6: Int;
    rec7: Int;
    rec8: Int;
}

struct Holder {
    content: Rec;
}

contract RecursionSim {
    hold: Holder;

    init() {
        self.hold = Holder{
            content: Rec{
                rec1:1,rec2:2,rec3:3,rec4:4,
                rec5:5,rec6:6,rec7:7,rec8:8
            }
        };
    }
}