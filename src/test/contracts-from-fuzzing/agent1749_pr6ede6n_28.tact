struct Sinner {
    value: Int;
    text: String;
}

contract StructArrayEmulation {
    a: Sinner;
    b: Sinner;
    c: Sinner;
    init() {
        self.a = Sinner{ value:1,text:"one"};
        self.b = Sinner{ value:2,text:"two"};
        self.c = Sinner{ value:3,text:"three"};
    }
}