struct ComplexDefault {
    s1: InnerDefault;
    s2: InnerDefault = InnerDefault{x:5,y:true};
}

struct InnerDefault {
    x: Int;
    y: Bool;
}

contract TestContract {
    field: ComplexDefault;

    init() {
        self.field = ComplexDefault{
            s1: InnerDefault{x:10,y:false},
            s2: InnerDefault{x:20,y:true},
        };
    }
}