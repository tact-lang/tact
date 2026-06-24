struct S {
    a: Int;
    b: Bool;
    c: String;
}

struct W {
    s: S;
    x: Int;
}

contract NestedWrap {
    w: W;

    init() {
        self.w = W{
            s: S{a:5,b:true,c:"tact"},
            x:10
        };
    }
}
