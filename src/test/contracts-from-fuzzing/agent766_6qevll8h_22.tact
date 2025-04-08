// combination of optionals and nested structs
struct InnerMost {
    leaf: Int?;
}

struct Inner {
    x: Int;
    y: InnerMost?;
}

struct Outer {
    inr: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inr: Inner{
                x: 42,
                y: InnerMost{
                    leaf: 5
                }
            }
        };
    }
}