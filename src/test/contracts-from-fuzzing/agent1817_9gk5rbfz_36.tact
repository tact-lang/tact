// Test complex mix of direct primitive fields and nested struct
struct Inner {
    x: Int; y: Int;
}

contract MixAndNest {
    a: Int;
    b: Bool;
    c: Inner;
    d: String;
    e: Slice;

    init() {
        self.a=1; self.b=true;
        self.c=Inner{x:5,y:6};
        self.d="hello"; self.e=emptyCell().asSlice();
    }
}
