struct AB {
    a: Int;
    b: Bool;
}

struct S {
    f1: AB;
    f2: AB;
    f3: AB;
}

contract ManyNestedSameStruct {
    data: S;

    init() {
        self.data = S{
            f1: AB{a:1,b:true},
            f2: AB{a:2,b:false},
            f3: AB{a:3,b:true}
        };
    }
}