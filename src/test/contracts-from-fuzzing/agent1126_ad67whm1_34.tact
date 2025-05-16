struct Inner {
    n: Int?; 
    flag: Bool?; 
}

struct Outer {
    s: Inner?;
    m: Int;
}

contract DeepOptionInit {
    val: Outer;

    init() {
        self.val = Outer{
            s: Inner{ n: 42, flag: null },
            m: 100
        };
    }
}