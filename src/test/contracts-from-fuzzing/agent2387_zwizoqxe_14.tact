struct InnerData {
    val: Int;
}

struct Layer1 {
    inner: InnerData;
}

struct Layer2 {
    l1: Layer1;
}

struct Layer3 {
    l2: Layer2;
}

contract MultiLayer {
    complex: Layer3;
    init() {
        self.complex = Layer3{
            l2: Layer2{
                l1: Layer1{
                    inner: InnerData{
                        val: 12345,
                    },
                },
            },
        };
    }
}