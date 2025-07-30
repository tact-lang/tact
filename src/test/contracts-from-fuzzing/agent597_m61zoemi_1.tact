struct NestedOpt {
    foo: Int?;
    bar: Int?;
}

contract TestContract {
    nestedOpt: NestedOpt;
    
    init() {
        self.nestedOpt = NestedOpt{ foo: null, bar: 42 };
    }
}