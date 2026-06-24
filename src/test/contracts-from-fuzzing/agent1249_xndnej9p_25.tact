struct Inner {
    num: Int = 5;
    flag: Bool = false;
}

struct Outer {
    nested: Inner;
    opt: String?;
}

contract DefaultInsideNested {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{},
            opt: null
        };
    }
}