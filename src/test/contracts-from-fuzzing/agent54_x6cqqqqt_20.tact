struct Rec {
    a: Int;
    b: Bool;
}

struct Outer {
    ref: Rec;
    opt: Rec?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            ref: Rec{a:1,b:true},
            opt: null
        };
    }
}