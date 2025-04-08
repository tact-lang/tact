struct Outer {
    o1: Int;
    o2: Inner?;
    o3: Bool;
}

struct Inner {
    i1: Int;
    i2: String?;
}

contract OptMiddle {
    val: Outer;
    
    init() {
        self.val = Outer{
            o1: 5,
            o2: null,
            o3: true,
        };
    }
}
