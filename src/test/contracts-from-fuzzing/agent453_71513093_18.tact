struct NestedMany {
    f1: S1;
    f2: S2;
}

struct S1 {
    a:Int; b:Int; c:Int;
}

struct S2 {
    d:Int; e:Int; f:Int;
}

contract TestContract {
    data: NestedMany;
    init(){
        self.data = NestedMany{
            f1:S1{a:1,b:2,c:3},
            f2:S2{d:4,e:5,f:6}
        };
    }
}