struct NestedOpt {
    innerOpt: Int?;
}

struct Outer {
    outerOpt: NestedOpt?;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            outerOpt: null,
        };
    }
}