struct Big {
    x1: Int; x2: Int; x3: Int; x4: Int; x5: Int;
    y1: Bool; y2: Bool; y3: Bool; y4: Bool; y5: Bool;
    s1: String;
    s2: String?;
}

contract TestContract {
    state: Big;
    init() {
        self.state = Big{
            x1:1,x2:2,x3:3,x4:4,x5:5,
            y1:true,y2:false,y3:true,y4:false,y5:true,
            s1:"abc",
            s2:null
        };
    }
}