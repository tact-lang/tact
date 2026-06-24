struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: S1;
    y: S1;
}

contract TestContract {
    val1: S2;
    val2: S2;
    optionalVal: S2?;

    init() {
        self.val1 = S2{x: S1{a:1,b:true}, y:S1{a:2,b:false}};
        self.val2 = S2{x: S1{a:3,b:true}, y:S1{a:4,b:false}};
        self.optionalVal = null;
    }
}