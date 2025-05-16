struct A { a:Int; }
struct B { b:Bool; }
struct C { c:String; }
struct D { d:Int?; }

struct NestedABCD {
    aa: A;
    bb: B;
    cc: C;
    dd: D;
}

contract DeepMix {
    data: NestedABCD;

    init() {
        self.data = NestedABCD{
            aa:A{a:1},
            bb:B{b:true},
            cc:C{c:"x"},
            dd:D{d:null},
        };
    }
}
