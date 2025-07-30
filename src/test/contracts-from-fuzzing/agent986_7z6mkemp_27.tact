struct InnerMost {
    z: Bool?;
}
struct Inner {
    y: InnerMost;
}
struct Outer {
    x: Inner;
}

contract DeepOptStruct {
    d: Outer;
    init() {
        self.d = Outer{ x: Inner{ y: InnerMost{ z: null } } };
    }
}
