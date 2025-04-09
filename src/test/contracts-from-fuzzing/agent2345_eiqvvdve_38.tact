struct Inner {
    a: Int = 1;
    b: String? = null;
}

struct Outer {
    sub: Inner;
    flag: Bool = true;
}

contract DeepDef {
    val: Outer;
    init() {
        self.val = Outer{
            sub: Inner{}, flag: false
        };
    }
}