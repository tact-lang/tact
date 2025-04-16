struct Inner {
    x: Int;
    y: Int?;
    z: Bool;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
}

contract ManyNestedStructFields {
    val: Outer;

    init() {
        self.val = Outer{
            a: Inner{ x:1, y:2, z:true },
            b: Inner{ x:3, y:null, z:false },
            c: Inner{ x:4, y:5, z:false },
            d: Inner{ x:6, y:7, z:true }
        };
    }
}