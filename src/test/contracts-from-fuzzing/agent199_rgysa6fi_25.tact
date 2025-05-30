struct Layer1 {
    a: Int?;
    b: Bool?;
}
struct Layer2 {
    inner: Layer1;
}
struct Layer3 {
    nested: Layer2;
}

contract MultiLayerNestedOptionals {
    data: Layer3;

    init() {
        self.data = Layer3{
            nested: Layer2{
                inner: Layer1{
                    a: null,
                    b: true,
                }
            }
        };
    }
}