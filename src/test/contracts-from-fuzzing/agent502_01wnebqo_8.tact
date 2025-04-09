struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    z: S1;
    w: S1?;
}

contract TestContract {
    val: S2;

    init() {
        self.val = S2{
            z: S1{x:1,y:true},
            w: null
        };
    }
}