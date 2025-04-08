struct OptNested {
    inner: Int?;
}

struct Outer {
    nestedOpt: OptNested?;
}

contract OptInsideOptStruct {
    s: Outer;
    init() {
        self.s = Outer{
            nestedOpt: null
        };
    }
}
