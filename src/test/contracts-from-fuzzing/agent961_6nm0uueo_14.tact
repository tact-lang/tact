struct DeeplyNested1 {
    field: Int;
}
struct DeeplyNested2 {
    nested: DeeplyNested1;
}
struct DeeplyNested3 {
    nested: DeeplyNested2;
}
struct DeeplyNested4 {
    nested: DeeplyNested3;
}

contract DeepChainContract {
    data: DeeplyNested4;
    init() {
        self.data = DeeplyNested4{
            nested: DeeplyNested3{
                nested: DeeplyNested2{
                    nested: DeeplyNested1{field: 777}
                }
            }
        };
    }
}