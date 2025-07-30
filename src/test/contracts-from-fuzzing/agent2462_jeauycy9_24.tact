struct L2 { p:Int; q:Bool; }

struct L1 { val: Int?; nest: L2; }

contract Edge {
    f1: Int;
    f2: L1;
    f3: Bool;

    init() {
        self.f1=1;
        self.f2=L1{val:null, nest:L2{p:7,q:true}};
        self.f3=false;
    }
}