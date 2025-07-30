struct S {
    x: Int;
    y: Bool;
}

contract AssignThenOverride {
    val: S;

    init() {
        self.val = S{x:1,y:true};
        self.val = S{x:2,y:false};
    }
}