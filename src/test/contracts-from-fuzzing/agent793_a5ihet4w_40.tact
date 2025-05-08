struct NestedS {
    a: Int;
    inner: S;
}

struct S {
    x: Int;
    y: Bool;
}

contract TestContract {
    val: NestedS;
    
    init() {
        self.val = NestedS{a:5, inner:S{x:7,y:true}};
    }
    
    receive() {}
}