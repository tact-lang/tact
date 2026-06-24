struct LargeDeepNested {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
}

struct Inner {
    x: Nested;
    y: Nested;
}

struct Nested {
    val1: Int;
    val2: Bool;
}

contract LargeDeepContract {
    data: LargeDeepNested;

    init() {
        self.data = LargeDeepNested{
            a: Inner{ x: Nested{val1:1,val2:true}, y:Nested{val1:2,val2:false} },
            b: Inner{ x: Nested{val1:3,val2:true}, y:Nested{val1:4,val2:false} },
            c: Inner{ x: Nested{val1:5,val2:true}, y:Nested{val1:6,val2:false} },
            d: Inner{ x: Nested{val1:7,val2:true}, y:Nested{val1:8,val2:false} }
        };
    }
}