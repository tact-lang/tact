struct Outer {
    a: Int; 
    inner: Middle;
}

struct Middle {
    b: Bool;
    inner: Inner;
}

struct Inner {
    c: Int;
}

contract Test17 {
    data: Outer;
    init() {
        self.data = Outer{
            a: 1,
            inner: Middle{
                b:true,
                inner: Inner{ c:99 }
            }
        };
    }
}