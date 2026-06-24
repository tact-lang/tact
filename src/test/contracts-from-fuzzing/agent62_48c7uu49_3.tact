struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    left: Inner;
    right: Inner?;
}

contract Test3 {
    data: Outer;
    init() {
        self.data = Outer{
            left: Inner{x:1, y:true},
            right: null
        };
    }
}