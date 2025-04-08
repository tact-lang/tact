struct Layer3 {
    val: Int?;
}

struct Layer2 {
    inner: Layer3;
}

struct Layer1 {
    nested: Layer2;
}

contract Test {
    deep: Layer1;

    init() {
        self.deep = Layer1{
            nested: Layer2{
                inner: Layer3{
                    val: null
                }
            }
        };
    }
}