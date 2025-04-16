struct NestedOpt {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

contract TestContract {
    data: NestedOpt;
    
    init() {
        self.data = NestedOpt{
            field1: null,
            field2: null,
            field3: null,
        };
    }
}