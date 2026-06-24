struct Inner {
    s: String;
    i: Int;
    b: Bool;
}

struct Middle {
    x: Inner;
    y: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract TestStorage {
    deep: Outer;
    init() {
        self.deep = Outer{
            m1: Middle{
               x: Inner{ s:"a", i:1, b:true },
               y: Inner{ s:"b", i:2, b:false }
            },
            m2: Middle{
               x: Inner{ s:"c", i:3, b:true },
               y: Inner{ s:"d", i:4, b:false }
            }
        };
    }
}
