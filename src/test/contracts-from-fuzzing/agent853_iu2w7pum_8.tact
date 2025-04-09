struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    sub1: Inner;
    sub2: Inner;
    sub3: Inner?;
    val: Int?;
}

contract ComplexField {
    huge: Outer;

    init() {
        self.huge = Outer{
            sub1: Inner{a:1,b:true,c:"A"},
            sub2: Inner{a:2,b:false,c:"B"},
            sub3: null,
            val: null,
        };
    }
}