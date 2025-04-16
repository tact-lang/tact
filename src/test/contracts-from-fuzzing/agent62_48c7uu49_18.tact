struct Inner {
    data: String?;
    val: Int;
}

struct Outer {
    nested: Inner?;
    flag: Bool;
}

contract Test18 {
    field: Outer;
    init() {
        self.field = Outer{
            nested: null,
            flag: false
        };
    }
}