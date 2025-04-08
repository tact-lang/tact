struct L1 {
    v1: Int?;
    v2: Bool?;
}

struct L2 {
    i1: L1?;
    flag: Bool;
}

struct L3 {
    nest: L2;
    str: String?;
}

contract OptionalAcross {
    state: L3?;
    init() {
        self.state = L3{
            nest: L2{
                i1: L1{v1:null,v2:null},
                flag:true
            },
            str:null
        };
    }
}