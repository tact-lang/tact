struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    s: String;
}

contract NestedStruct {
    payload: Outer;

    init() {
        self.payload = Outer{inner: Inner{a:1, b:true}, s:"hi"};
    }
}