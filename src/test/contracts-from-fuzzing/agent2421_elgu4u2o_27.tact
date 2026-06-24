struct DeepInner {
    x: Int;
    y: Bool?;
}

struct Middle {
    deep: DeepInner;
    flag: Bool;
}

struct Outer {
    inner: Middle;
    msg: String?;
}

contract LaurentNested {
    nested: Outer;
    init() {
        self.nested = Outer{
            inner: Middle{
                deep: DeepInner{ x:42, y:null },
                flag: true
            },
            msg: null
        };
    }
}