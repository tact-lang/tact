struct InnerMost {
    x: Int;
    y: Int;
}

struct Inner {
    im: InnerMost; 
    z: Bool;
    w: Int?;
}

struct Outer {
    inner: Inner; 
    flag: Bool?;
}

contract DeepNestedContract {
    val: Outer;
    init() {
        self.val = Outer{
            inner: Inner{
                im: InnerMost{
                    x: 1,
                    y: 2
                },
                z: true,
                w: null
            },
            flag: false
        };
    }
}