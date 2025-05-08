// Many optional fields across multiple types, nested
struct InnerMost {
    p: Int?;
    q: Bool?;
}

struct Inner {
    a: InnerMost?;
    b: String?;
}

struct Outer {
    x: Inner?;
    y: Bool?;
    z: Int?;
}

contract TestContract {
    val: Outer;
    init() {
        self.val = Outer{
            x: null,
            y: null,
            z: null
        };
    }
}