struct Layer2 {
    x: Int;
    y: String?;
}

struct Layer1 {
    inner: Layer2?;
}

contract NestedOptionalStructs {
    data: Layer1;

    init() {
        self.data = Layer1{
            inner: Layer2{
                x: 5,
                y: null
            }
        };
    }
}
