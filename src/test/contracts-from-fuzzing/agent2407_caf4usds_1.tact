struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: NestedOpt;
    
    init() {
        self.data = NestedOpt{
            foo: 123,
            bar: true,
        };
    }
}