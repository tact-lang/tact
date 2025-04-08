// struct with string, int, bool, optional variants combined, to stress storage layout
struct Combo {
    i1: Int;
    s1: String;
    b1: Bool;
    o1: Int?;
    o2: String?;
    o3: Bool?;
    s2: String;
    i2: Int;
}

contract StressIt {
    data: Combo;
    init() {
        self.data = Combo{
            i1:1, s1:"A", b1:true, o1:null, o2:null, o3:null, s2:"B", i2:2
        };
    }
}