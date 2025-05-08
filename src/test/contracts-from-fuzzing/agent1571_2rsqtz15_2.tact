struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

struct Outer {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract Test2 {
    data: Outer;
    
    init() {
        self.data = Outer{
            one: Inner{ x:1, y:true, z:"one" },
            two: Inner{ x:2, y:false, z:"two" },
            three: Inner{ x:3, y:true, z:"three" }
        };
    }
}
