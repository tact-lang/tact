struct WideNested {
    sa: SA;
    sb: SB;
    sc: SC;
    sd: SD;
}

struct SA { x: Int; }
struct SB { y: String; }
struct SC { z: Bool; }
struct SD { t: Int?; }

contract WideNestedTest {
    w: WideNested;

    init() {
        self.w = WideNested{
            sa: SA{x:1},
            sb: SB{y:"y"},
            sc: SC{z:true},
            sd: SD{t:null},
        };
    }
}