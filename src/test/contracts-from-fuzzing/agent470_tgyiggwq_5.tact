struct Layer3 {
    val: Int?;
}

struct Layer2 {
    nest: Layer3;
}

struct Layer1 {
    inner: Layer2;
}

contract DeeplyNested {
    data: Layer1;

    init() {
        self.data = Layer1{
            inner: Layer2{
                nest: Layer3{
                    val: null
                }
            }
        };
    }
}