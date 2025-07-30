struct NestedInner {
    x: Int;
    y: Bool;
}

contract MiddleFields {
    a: Int;
    b: NestedInner;
    c: Int;
    d: NestedInner;

    init() {
        self.a=1; self.b=NestedInner{x:2,y:true}; self.c=3; self.d=NestedInner{x:4,y:false};
    }
}