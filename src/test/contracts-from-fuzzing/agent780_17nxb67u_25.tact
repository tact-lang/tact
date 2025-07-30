struct Rec1 {
    a: Int;
}

struct Rec2 {
    r: Rec1;
}

struct Rec3 {
    r: Rec2;
}

struct Rec4 {
    r: Rec3;
}

struct Rec5 {
    r: Rec4;
}

struct Rec6 {
    r: Rec5;
}

struct Rec7 {
    r: Rec6;
}

struct Rec8 {
    r: Rec7;
}

struct Rec9 {
    r: Rec8;
}

contract DeepNineNest {
    r: Rec9;

    init() {
        self.r = Rec9{
            r: Rec8{
            r: Rec7{
            r: Rec6{
            r: Rec5{
            r: Rec4{
            r: Rec3{
            r: Rec2{
            r: Rec1{a:1}
            }}}}}}}
        };
    }
}