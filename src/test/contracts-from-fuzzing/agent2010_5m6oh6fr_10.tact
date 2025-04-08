struct Bottom {
    num: Int;
    flag: Bool?;
    text: String;
}

struct Middle1 {
    b: Bottom;
    s: String;
}

struct Middle2 {
    b: Bottom;
    s: String;
}

struct Top {
    m1: Middle1;
    m2: Middle2;
    count: Int;
}

contract Complicated {
    top: Top;

    init() {
        self.top = Top{
            m1: Middle1{ b:Bottom{num:1,flag:true,text:"A"}, s:"one" },
            m2: Middle2{ b:Bottom{num:2,flag:null,text:"B"}, s:"two" },
            count: 7,
        };
    }
}