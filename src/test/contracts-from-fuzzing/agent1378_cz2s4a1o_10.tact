struct ManyOpt {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Int?;
    o7: Int?;
    o8: Int?;
}

contract OptContract {
    mo: ManyOpt = ManyOpt{ o1:null, o2:null, o3:null, o4:null, o5:null, o6:null, o7:null, o8:null };
    init() {
        self.mo = ManyOpt{ o1:1, o2:2, o3:3, o4:4, o5:5, o6:6, o7:7, o8:8};
    }
    receive() {}
}