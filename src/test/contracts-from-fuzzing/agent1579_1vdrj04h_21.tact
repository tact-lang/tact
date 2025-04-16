struct NestedMixOpt {
    a: Int;
    b: Bool?;
    c: Int?;
}

contract StorageWithNestedMixOpt {
    data: NestedMixOpt;
    
    init() {
        self.data = NestedMixOpt{
            a: 1,
            b: null,
            c: null
        };
    }
}