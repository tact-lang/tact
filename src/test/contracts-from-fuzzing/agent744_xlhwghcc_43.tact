struct ComplexWithDefaults {
    a:Int=1;
    b:Bool=false;
    c:String="x";
    d:Int?=null;
    e:Bool?=null;
    f:String?=null;
}

contract HoldComplex {
    s:ComplexWithDefaults;

    init() {
        self.s=ComplexWithDefaults{};
    }
}