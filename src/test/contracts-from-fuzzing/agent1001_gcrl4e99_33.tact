// deeply nested nullable structs

struct InnerInner {
    iii: Bool?;
}

struct Inner {
    inin: InnerInner?;
    k: Int;
}

struct Outer {
    nest: Inner?;
    x: Int?;
}

contract DeepNulls {
    data: Outer;

    init() {
        self.data = Outer{
            nest: null,
            x: null
        };
    }
}