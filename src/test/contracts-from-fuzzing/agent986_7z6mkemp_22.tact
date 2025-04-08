struct Inner {
    n: Int;
}

struct Outer {
    a: Int;
    b: Bool;
    c: Inner;
    d: Inner?;
}

contract MixedNested {
    val: Outer;

    init() {
        self.val = Outer{
            a:1, b:true, c:Inner{n:10}, d:null
        };
    }
}
