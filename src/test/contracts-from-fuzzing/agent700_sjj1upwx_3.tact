struct Inner {
    x: Int;
    y: Bool?;
    z: String;
}

struct Middle {
    i: Int?;
    inner: Inner;
}

struct Outer {
    m: Middle?;
    flag: Bool;
    note: String?;
}

contract NestedOptionals {
    data: Outer;
    
    init() {
        self.data = Outer{
            m: null,
            flag: false,
            note: null
        };
    }
}