struct Outer {
    sa: Inner;
    sb: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TwoNestedStructs {
    val: Outer;

    init() {
        self.val = Outer{
            sa: Inner{a:1,b:true,c:"hi"},
            sb: Inner{a:2,b:false,c:"yo"}
        };
    }
}