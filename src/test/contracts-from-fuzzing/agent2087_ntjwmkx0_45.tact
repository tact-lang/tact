struct A {
    x: Int;
    y: Bool;
}

struct B {
    ref: A;
    s: String;
}

contract ComposeAB {
    f: B;

    init() {
        self.f = B{ref:A{x:1,y:true},s:"abc"};
    }
}