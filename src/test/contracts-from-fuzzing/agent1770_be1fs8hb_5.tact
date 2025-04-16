struct L2 {
    value: Int;
}

struct L1 {
    nested: L2;
}

struct Root {
    wrapper: L1;
}

contract DeepStruct {
    data: Root;

    init() {
        self.data = Root{
            wrapper: L1{
                nested: L2{
                    value: 123
                }
            }
        };
    }
}