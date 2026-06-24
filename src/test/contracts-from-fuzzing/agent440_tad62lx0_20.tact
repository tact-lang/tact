struct InnerMost {
    val: Int?;
    flag: Bool?;
}

struct Inner {
    nested: InnerMost?;
    count: Int?;
}

struct Outer {
    deep: Inner?;
    active: Bool;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            deep: null,
            active: true
        };
    }
}